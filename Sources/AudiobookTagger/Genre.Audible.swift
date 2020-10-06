//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/28/20.
//

import Foundation

/// Audiobook Genres and Categories curated from Audible and Quicktime Documentation
enum GenreAudible {
    case artsAndEntertainment(ArtsAndEntertainment)
    case biosAndMemoirs(BiosAndMemoirs)
    case business(Business)
    case classics(Classics)
    case eroticaAndSexuality(EroticaAndSexuality)
    case fiction(Fiction)
    case history(History)
    case mysteryAndThrillers(MysteryAndThrillers)
    case romance(Romance)
    case scienceAndTechnology(ScienceAndTechnology)
    case scifiAndFantasy(SciFiAndFantasy)
    case selfDevelopment(SelfDevelopment)
    case comdey(Comedy)
    case newspapersAndMagazines(NewspapersAndMagazines)
    case nostalgiaRadio(NostalgiaRadio)
    case radioAndTV(RadioAndTV)
    case sports(Sports)
    case travelAndAdventure(TravelAndAdventure)
    case religionAndSpirituality(ReligionAndSpirituality)
    case nonfiction(NonFiction)
    case liveEvents(LiveEvents)
    case languageInstruction(LanguageInstruction)
    case dramaAndPoetry(DramaAndPoetry)
    case healthAndFitness(HealthAndFitness)
    case kids(Kids)
    case teens(Teens)

    enum ArtsAndEntertainment: String {
        case celebrityBios = "Arts & Entertainment|Celebrity Bios"
        case interviewsAndPanels = "Arts & Entertainment|Interviews & Panels"
        case music = "Arts & Entertainment|Music"
        case tvAndFilm = "Arts & Entertainment|TV & Film"
        case visualArts = "Arts & Entertainment|Visual Arts"
        case other = "Other"
    }
    
    enum BiosAndMemoirs: String {
        case writersAndMusicians = "Bios & Memoirs|Artists, Writers & Musicians"
        case businessLeaders = "Bios & Memoirs|Business Leaders"
        case celebrities = "Bios & Memoirs|Celebrities"
        case criminals = "Bios & Memoirs|Criminals"
        case personalMemoirs = "Bios & Memoirs|Personal Memoirs"
        case politicalFigures = "Bios & Memoirs|Political Figures"
        case religiousFigures = "Bios & Memoirs|Religious Figures"
        case scienceAndTechnologyLeaders = "Bios & Memoirs|Science & Technology Leaders"
        case other = "Other"
    }
    
    enum Business: String {
        case careerSkills = "Business|Career Skills"
        case commerceAndEconomy = "Business|Commerce & Economy"
        case leadership = "Business|Leadership"
        case management = "Business|Management"
        case marketing = "Business|Marketing"
        case financeAndInvesting = "Business|Personal Finance & Investing"
        case sales = "Business|Sales"
        case other = "Other"
    }
    
    enum Classics: String {
        case americanLit = "Classics|American Literature"
        case britishLit = "Classics|British Literature"
        case drama = "Classics|Drama"
        case europeanLit = "Classics|European Literature"
        case greekAndRomance = "Classics|Greek & Roman"
        case kidsAndYoungAdult = "Classics|Kids & Young Adults"
        case nonfiction = "Classics|Nonfiction"
        case poetry = "Classics|Poetry"
        case shakespeare = "Classics|Shakespeare"
        case worldLit = "Classics|World Literature"
        case other = "Other"
    }
    
    enum EroticaAndSexuality: String {
        case advice = "Erotica & Sexuality|Advice"
        case fiction = "Erotica & Sexuality|Fiction"
        case susieBright = "Erotica & Sexuality|Susie Bright"
        case other = "Other"
    }
    
    enum Fiction: String {
        case africanAmerican = "Fiction|African-American"
        case chickLit = "Fiction|Chick Lit"
        case contemporary = "Fiction|Contemporary"
        case lgbt = "Fiction|Gay & Lesbian"
        case historical = "Fiction|Historical"
        case horror = "Fiction|Horror"
        case humor = "Fiction|Humor"
        case literary = "Fiction|Literary"
        case religiousInspirational = "Fiction|Religious & Inspirational"
        case shortStoriesAndAnthologies = "Fiction|Short Stories & Anthologies"
        case westerns = "Fiction|Westerns"
        case other = "Other"
    }
    
    enum History: String {
        case twentiethCentury = "History|20th Century"
        case twentyFirstCentury = "History|21st Century"
        case american = "History|American"
        case ancient = "History|Ancient"
        case european = "History|European"
        case kidsAndYoungAdults = "History|Kids & Young Adults"
        case military = "History|Military"
        case political = "History|Political"
        case world = "History|World"
        case other = "Other"
    }
    
    enum MysteryAndThrillers: String {
        case anthologies = "Mysteries & Thrillers|Anthologies"
        case classicDetective = "Mysteries & Thrillers|Classic Detective"
        case cozyMysteries = "Mysteries & Thrillers|Cozy Mysteries"
        case espionage = "Mysteries & Thrillers|Espionage"
        case historical = "Mysteries & Thrillers|Historical"
        case mysteryAndCrime = "Mysteries & Thrillers|International Mystery & Crime"
        case legalThrillers = "Mysteries & Thrillers|Legal Thrillers"
        case medicalThrillers = "Mysteries & Thrillers|Medical Thrillers"
        case military = "Mysteries & Thrillers|Military"
        case modernDetective = "Mysteries & Thrillers|Modern Detective"
        case noir = "Mysteries & Thrillers|Noir"
        case policeProcedurals = "Mysteries & Thrillers|Police Procedurals"
        case political = "Mysteries & Thrillers|Political"
        case psychological = "Mysteries & Thrillers|Psychological"
        case radioDramas = "Mysteries & Thrillers|Radio Dramas"
        case supernaturalAndParanormal = "Mysteries & Thrillers|Supernatural & Paranormal"
        case suspense = "Mysteries & Thrillers|Suspense"
        case technothrillers = "Mysteries & Thrillers|Technothrillers"
        case terrorism = "Mysteries & Thrillers|Terrorism"
        case trueCrime = "Mysteries & Thrillers|True Crime"
        case other = "Other"
    }
    
    enum Romance: String {
        case africalAmerican = "Romance|African American"
        case contemporary = "Romance|Contemporary"
        case erotica = "Romance|Erotica"
        case fantasy = "Romance|Fantasy"
        case lesbian = "Romance|F/F"
        case harem = "Romance|Harem"
        case historical = "Romance|Historical"
        case gay = "Romance|M/M"
        case menagePoly = "Romance|Menage/Polyamorous"
        case military = "Romance|Military"
        case multicultural = "Romance|Multicultural"
        case omegaverseMPreg = "Romance|Omegaverse & MPreg"
        case newAdult = "Romance|New Adult"
        case paranormal = "Romance|Paranormal"
        case regency = "Romance|Regency"
        case religiousInspirational = "Romance|Religious & Inspirational"
        case romanticComedy = "Romance|Romantic Comedy"
        case scienceFiction = "Romance|Science Fiction"
        case suspense = "Romance|Suspense"
        case transgender = "Romance|Transgender"
        case westerns = "Romance|Westerns"
        case other = "Other"
    }
    
    enum ScienceAndTechnology: String {
        case astronomy = "Science & Technology|Astronomy"
        case biology = "Science & Technology|Biology"
        case environment = "Science & Technology|Environment"
        case magazineAndRadio = "Science & Technology|Magazine & Radio"
        case medicine = "Science & Technology|Medicine"
        case physics = "Science & Technology|Physics"
        case psychologyAndTheMind = "Science & Technology|Psychology & The Mind"
        case technology = "Science & Technology|Technology"
        case other = "Other"
    }
    
    enum SciFiAndFantasy: String {
        case alternateHistory = "Sci-Fi & Fantasy|Alternate History"
        case darkFantasy = "Sci-Fi & Fantasy|Dark Fantasy"
        case doctorWho = "Sci-Fi & Fantasy|Doctor Who"
        case dramatizations = "Sci-Fi & Fantasy|Dramatizations"
        case contemporary = "Sci-Fi & Fantasy|Fantasy: Contemporary"
        case epicFantasy = "Sci-Fi & Fantasy|Fantasy: Epic"
        case paranormalFantasy = "Sci-Fi & Fantasy|Fantasy: Paranormal"
        case militarySciFi = "Sci-Fi & Fantasy|Military Sci-Fi"
        case postApocalyptic = "Sci-Fi & Fantasy|Post-Apocalyptic"
        case classicSciFi = "Sci-Fi & Fantasy|Sci-Fi: Classic"
        case contemporarySciFi = "Sci-Fi & Fantasy|Sci-Fi: Contemporary"
        case shortStoriesAndAnthologies = "Sci-Fi & Fantasy|Short Stories & Anthologies"
        case spaceOpera = "Sci-Fi & Fantasy|Space Opera"
        case starTrek = "Sci-Fi & Fantasy|Star Trek"
        case starWars = "Sci-Fi & Fantasy|Star Wars"
        case steampunk = "Sci-Fi & Fantasy|Steampunk"
        case superheroes = "Sci-Fi & Fantasy|Superheroes"
        case swordAndSorcery = "Sci-Fi & Fantasy|Sword & Sorcery"
        case timeTravel = "Sci-Fi & Fantasy|Time Travel"
        case other = "Other"
    }
    
    enum SelfDevelopment: String {
        case communicationSkills = "Self-Development|Communication Skills"
        case howTo = "Self-Development|How-To"
        case hypnosis = "Self-Development|Hypnosis"
        case meditation = "Self-Development|Meditation"
        case motivationAndInspiration = "Self-Development|Motivation & Inspiration"
        case parenting = "Self-Development|Parenting"
        case personalFinance = "Self-Development|Personal Finance"
        case relationships = "Self-Development|Relationships"
        case sexuality = "Self-Development|Sexuality"
        case other = "Other"
    }
    
    enum Comedy: String {
        case classicAmerican = "Comedy|Classic American"
        case classicBritish = "Comedy|Classic British"
        case memoirs = "Comedy|Memoirs"
        case satire = "Comedy|Satire"
        case standUpAndJokes = "Comedy|Stand-Up & Jokes"
        case storytelling = "Comedy|Storytelling"
        case other = "Other"
    }
    
    enum NewspapersAndMagazines: String {
        case business = "Newspapers & Magazines|Business"
        case health = "Newspapers & Magazines|Health"
        case newsAndCulture = "Newspapers & Magazines|News & Culture"
        case scienceAndTechnology = "Newspapers & Magazines|Science & Technology"
        case other = "Other"
    }
    
    enum NostalgiaRadio: String {
        case comedyAndVariety = "Nostalgia Radio|Comedy & Variety"
        case crimeAndMystery = "Nostalgia Radio|Crime & Mystery"
        case radioMovies = "Nostalgia Radio|Movies"
        case sciFiAndFantasy = "Nostalgia Radio|Sci-Fi & Fantasy"
        case radioWesterns = "Nostalgia Radio|Westerns"
        case other = "Other"
    }
    
    enum RadioAndTV: String {
        case british = "Radio & TV|British"
        case documentaries = "Radio & TV|Documentaries"
        case entertainment = "Radio & TV|Entertainment"
        case greatInterviews = "Radio & TV|Great Interviews"
        case howTo = "Radio & TV|How-To"
        case businessAndCulture = "Radio & TV|News, Business, & Culture"
        case scienceAndTechnology = "Radio & TV|Science & Technology"
        case other = "Other"
    }
    
    enum Sports: String {
        case baseball = "Sports|Baseball"
        case basketball = "Sports|Basketball"
        case football = "Sports|Football"
        case golf = "Sports|Golf"
        case other = "Sports|Other"
    }
    
    enum TravelAndAdventure: String {
        case adventureAndExploration = "Travel & Adventure|Adventure & Exploration"
        case essaysAndTravelogues = "Travel & Adventure|Essays & Travelogues"
        case guidedTours = "Travel & Adventure|Guided Tours"
        case other = "Other"
    }
    
    enum ReligionAndSpirituality: String {
        case bibles = "Religion & Spirituality|Bibles"
        case buddhismAndEasternReligions = "Religion & Spirituality|Buddhism & Eastern Religions"
        case christianity = "Religion & Spirituality|Christianity"
        case islam = "Religion & Spirituality|Islam"
        case judaism = "Religion & Spirituality|Judaism"
        case religiousThought = "Religion & Spirituality|Religious Thought"
        case sermonsAndMinistries = "Religion & Spirituality|Sermons & Ministries"
        case other = "Other"
    }
    
    enum NonFiction: String {
        case economics = "Nonfiction|Economics"
        case genderIssues = "Nonfiction|Gender Issues"
        case philosophy = "Nonfiction|Philosophy"
        case politics = "Nonfiction|Politics"
        case socialSciences = "Nonfiction|Social Sciences"
        case trueCrime = "Nonfiction|True Crime"
        case unexplainedPhenomena = "Nonfiction|Unexplained Phenomena"
        case worldAffairs = "Nonfiction|World Affairs"
        case other = "Other"
    }
    
    enum LiveEvents: String {
        case business = "Live Events|Business"
        case comedy = "Live Events|Comedy"
        case culture = "Live Events|Culture"
        case personalGrowth = "Live Events|Personal Growth"
        case politics = "Live Events|Politics"
        case storytellers = "Live Events|Storytellers"
        case other = "Other"
    }
    
    enum LanguageInstruction: String {
        case english = "Language Instruction|English"
        case french = "Language Instruction|French"
        case german = "Language Instruction|German"
        case italian = "Language Instruction|Italian"
        case japanese = "Language Instruction|Japanese"
        case kidsAndYoungAdults = "Language Instruction|Kids & Young Adults"
        case otherLanguages = "Language Instruction|Other Languages"
        case spanish = "Language Instruction|Spanish"
    }
    
    enum DramaAndPoetry: String {
        case classicDrama = "Drama & Poetry|Classic Drama"
        case modernDrama = "Drama & Poetry|Modern Drama"
        case poetry = "Drama & Poetry|Poetry"
        case other = "Other"
    }
    
    enum HealthAndFitness: String {
        case agingWell = "Health & Fitness|Aging Well"
        case dietAndNutrition = "Health & Fitness|Diet & Nutrition"
        case workouts = "Health & Fitness|Workouts"
        case other = "Other"
    }
    
    enum Kids: String {
        case ages0to4 = "Kids|Ages 0-4"
        case ages5to7 = "Kids|Ages 5-7"
        case ages8to10 = "Kids|Ages 8-10"
        case animalStories = "Kids|Animal Stories"
        case biographiesAndHistory = "Kids|Biographies & History"
        case classics = "Kids|Classics"
        case fairyTalesAndMyths = "Kids|Fables, Fairy Tales & Myths"
        case ficion = "Kids|Fiction"
        case mysteries = "Kids|Mysteries"
        case nonfiction = "Kids|Nonfiction"
        case sciFiAndFantasy = "Kids|Sci-Fi & Fantasy"
        case studyGuides = "Kids|Study Guides"
        case withSynchronizedImages = "Kids|With Synchronized Images"
        case other = "Other"
    }
    
    enum Teens: String {
        case ages11to13 = "Teens|Ages 11-13"
        case ages13AndUp = "Teens|Ages 13 & Up"
        case biosAndMemoirs = "Teens|Bios & Memoirs"
        case familyAndRelationships = "Teens|Family & Relationships"
        case fictionAndLiterature = "Teens|Fiction & Literature"
        case healthAndSports = "Teens|Health & Sports"
        case historyAndHistoricalFiction = "Teens|History & Historical Fiction"
        case mysteriesAndThrillers = "Teens|Mysteries & Thrillers"
        case mythsAndLegends = "Teens|Myths & Legends"
        case religionAndSpirtuality = "Teens|Religion & Spirituality"
        case romanceAndFriendship = "Teens|Romance & Friendship"
        case sciFiAndFantasy = "Teens|Sci-Fi & Fantasy"
        case series = "Teens|Series"
        case socialIssues = "Teens|Social Issues"
        case studyGuidesAndLanguageLearning = "Teens|Study Guides & Language Learning"
        case other = "Other"
    }
}
