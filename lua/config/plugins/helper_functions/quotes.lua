local quotes = {
  "I do as I see fit.",
  "I rather have a bag full of 8s than a mind full of 10s.",
  "Freedom is the power to decide what your computer does, and the only way to have this freedom is to know what your computer is doing.",
  "The world is full of problems waiting to be solved.",
  "We live in an age of wonders.",
  "What I cannot create, I do not understand.",
  "A journey of a thousand miles starts with a single step.",
  "In life We play with a set of cards, but together We have the whole deck.",
  "The difference between science and screwing around is writing it down",
  "You will eventually use everything you have ever learned.",
  "It's nice to have a game that sells a milion copies.",
  "The giants have no timeouts",
  "Failure is not the opposite of success; it is part of it.",
  "It has been said that computers are basically people made out of metal or, conversely, people are computers made out of flesh and blood.",
  "However, once we get close to computers, we see that they are basically machines that follow very specifix and primitive instructions.",
  "I you take good care of things, they will have a soul someday, and when that happens, i promise, they will be eager to help you.",
  "Fun is not inherent, it is designed.",
  "Focus on the primary game loop.",
  "Sound is fundamental for gamefeel.",
  "An artists never completes a piece of art, it just stops working on it."
}

math.randomseed(os.time())
local function get_random_quote()
  return quotes[math.random(1, #quotes)]
end


return {
  get_random_quote = get_random_quote
}
