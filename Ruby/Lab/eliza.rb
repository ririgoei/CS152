#! /usr/bin/ruby -w

#Represents a Rogerian psychiatrist
class Shrink

  #initializes 'memory' of Eliza.
  def initialize()
    @he="he"
    @she="she"
	@they="they"
  end

  #read a statement and convert it to a psychiatric response.
  def generateResponse(blather)
    #downcase for ease of substitution
    blather = blather.downcase
	
	if blather.match(/^are you/)
		blather.sub!(/\bare you\b/,"IS IT IMPORTANT IF I AM")
	end
	
    #change 'you', 'your', etc. to uppercase 'I', 'MY'
    blather.gsub!(/\byour\b/,"MY")
    blather.gsub!(/\byou\b/,'I')
	
    #Replace 'my' with 'your', 'me' with 'you', 'I' with 'you', etc.
    blather.gsub!(/\bmy\b/,"your")
    blather.gsub!(/\bme\b/,"you")
    blather.gsub!(/\bi\b/,'you')
	
    #Sub in past references, but only for the 1st occurrence or it looks weird
    blather.sub!(/\b(he|him)\b/, @he)
    blather.sub!(/\b(she|her)\b/, @she)
	blather.sub!(/\b(they)\b/, @they)

	if blather.include? "never"
		blather = "Can you be more specific?"
	elsif blather.include? "always"
		blather = "Can you be more specific?"
	elsif blather.include? "might"
		blather = "Can you be more specific?"
	end
	
	if blather.match(/^well/)
		blather.slice! "well, "
	elsif blather.match(/^perhaps/)
		blather.slice! "perhaps "
	elsif blather.match(/^also/)
		blather.slice! "also, "
	end
	
    #Get future references -- note that these do NOT change the immediate output
    hePat=/.*\b(your (father|brother|(ex-?)?(husband|boyfriend)))\b.*/
    shePat = /.*\b(your (mother|sister|(ex-?)?(wife|girlfriend)))\b.*/
	theyPat= /.*\b(clowns)\b.*/
    @he=blather.sub(hePat, '\1').chomp if blather =~ hePat 
    @she=blather.sub(shePat, '\1').chomp if blather =~ shePat
    @they=blather.sub(theyPat, '\1').chomp if blather =~ theyPat
	
    #Deal with name
    namePat=/.*\byour name is (\w+).*/
    @name=blather.sub(namePat,'\1')
    blather.sub!(namePat,'nice to meet you, \1.  How can I help you')

    #results are uppercased, for aesthetics.
    if blather.include? "killed"
		return blather.upcase + "?" + " YOU POOR THING!"
	end
	
	return blather.upcase + "?";
	
  end
end


#main -- reads from standard input unless -test is the first parameter.
eliza = Shrink.new()
if ARGV[0] == "-test"
    ['My girlfriend never listens to me',
     "I think she might be deaf",
     "yes",
     "I am afraid of clowns",
     "Well, they just seem creepy",
     "Also, when I was a kid, a clown killed my mother and father",
      "Are you a clown in disguise?",
    ].each do |stmt|
        puts stmt
        puts eliza.generateResponse(stmt)
    end
else
  while line = gets
    response = eliza.generateResponse line
    puts response
  end
end