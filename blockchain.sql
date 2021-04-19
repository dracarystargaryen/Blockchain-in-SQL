DECLARE @DataBlock VARCHAR(1000)
DECLARE @i BINARY(32) = 0xFF
DECLARE @Nonce int = 0

while @i > @Difficulty
    and @Difficulty > 0x00 /*This prevents infinite looping*/
BEGIN
    SET @Nonce = @Nonce + 1
    SET @PlainText = @DataBlock + '|Nonce=' + CAST(@Nonce as VARCHAR(11))
    SET @i = HASHBYTES('SHA2_256', @PlainText)

END

SELECT Nonce = @Nonce, BlockHash = @i, HashedPlainText = @PlainText