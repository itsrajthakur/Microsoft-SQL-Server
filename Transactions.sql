CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    AccountName NVARCHAR(50),
    Balance DECIMAL(10, 2)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    FromAccountID INT,
    ToAccountID INT,
    Amount DECIMAL(10, 2),
    TransactionDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (FromAccountID) REFERENCES Accounts(AccountID),
    FOREIGN KEY (ToAccountID) REFERENCES Accounts(AccountID)
);

INSERT INTO Accounts (AccountID, AccountName, Balance) VALUES
(1, 'Alice', 1000.00),
(2, 'Bob', 500.00);

CREATE PROCEDURE TransferFunds
    @FromAccountID INT,
    @ToAccountID INT,
    @Amount DECIMAL(10, 2)
AS
BEGIN
    -- Start the transaction
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Check if there are sufficient funds
        DECLARE @CurrentBalance DECIMAL(10, 2);
        SELECT @CurrentBalance = Balance FROM Accounts WHERE AccountID = @FromAccountID;

        IF @CurrentBalance < @Amount
        BEGIN
            THROW 50001, 'Insufficient funds', 1; -- Custom error for insufficient funds
        END

        -- Deduct the amount from the sender's account
        UPDATE Accounts 
        SET Balance = Balance - @Amount 
        WHERE AccountID = @FromAccountID;

        -- Add the amount to the receiver's account
        UPDATE Accounts 
        SET Balance = Balance + @Amount 
        WHERE AccountID = @ToAccountID;

        -- Log the transaction
        INSERT INTO Transactions (FromAccountID, ToAccountID, Amount) 
        VALUES (@FromAccountID, @ToAccountID, @Amount);

        -- Commit the transaction
        COMMIT TRANSACTION;
        PRINT 'Transaction completed successfully!';
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if an error occurs
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
            PRINT 'Transaction rolled back due to an error.';
        END
        
        -- Display the error message
        PRINT 'Error: ' + ERROR_MESSAGE();
    END CATCH;
END;

BEGIN TRY
    -- Insert into a table
    INSERT INTO Accounts (AccountID, Balance) VALUES (1, 1000);
    
    -- Deduct from another account
    UPDATE Accounts SET Balance = Balance - 500 WHERE AccountID = 2;

    -- Commit the transaction if both operations succeed
    COMMIT TRANSACTION;
    PRINT 'Transaction completed successfully!';
END TRY
BEGIN CATCH
    -- Rollback the transaction if an error occurs
    ROLLBACK TRANSACTION;
    
    -- Get error details
    PRINT 'An error occurred: ' + ERROR_MESSAGE();
END CATCH;