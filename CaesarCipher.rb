#alphabet data set
$alphabet = ("a".."z").to_a

#function that takes single word to be decrypted
def plainTextInput()
    puts "Please enter a single word (no spaces): "
    word = gets.chomp #take user input
    puts "The plain text word submission is: #{word}"

    #begin encoding with user input
    textEncryptor(word, keyGenerator)

end

#function that randomly generates key for encrypting
def keyGenerator()
    key = rand(1 .. 26) #random key generation
    puts "Random key generated for shifting is: #{key}"
    return key 
end

#function that encrypts plain text
def textEncryptor(keyword, cipherKey)
    cipherText = ""


    #algorithm that uses key to shift letters encrypting given word
    keyword.each_char do |letter|
        
        oldIndex = $alphabet.find_index(letter)
        newIndex = (oldIndex + cipherKey) % $alphabet.count
        cipherText += $alphabet[newIndex]
    
    end

    puts "The cipher text is: #{cipherText}"

    #begin deciphiring encoded text for human readable original word
    textDecryptor(cipherText, cipherKey)

end

#function that decrypts encoded text
def textDecryptor(encodedText, cryptoKey)
    decryptedText = ""

    #algorithm that uses key to un-shift letters in encoded word to return to human readable form (original word)
    encodedText.each_char do |value|
        
        formerPosition = $alphabet.find_index(value)
        newPosition = (formerPosition - cryptoKey) % $alphabet.count
        decryptedText += $alphabet[newPosition]
    
    end
    puts "The cipher text decrypted is: #{decryptedText}"

end

#begin cipher by taking user input
plainTextInput

