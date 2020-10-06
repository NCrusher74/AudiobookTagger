//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 10/5/20.
//

import Foundation

enum GenreITunes {
    case books(Books)
    case audiobooks(Audiobooks)
    case textbooks(Textbooks)

    var rawValue: String {
        switch self {
            case .books(let genre): return genre.rawValue
            case .audiobooks(let genre): return genre.rawValue
            case .textbooks(let subject): return subject.rawValue
        }
    }
    
    enum Books {
        case nonfiction(NonFiction)
        case romance(Romance)
        case travelAndAdventure(TravelAndAdventure)
        case artsAndEntertainment(ArtsAndEntertainment)
        case biographiesAndMemoirs(BiographiesAndMemoirs)
        case businessAndPersonalFinance (BusinessAndPersonalFinance)
        case childrenAndTeens(ChildrenAndTeens)
        case humor
        case history(History)
        case religionAndSpirituality(ReligionAndSpirituality)
        case scienceAndNature(ScienceAndNature)
        case sciFiAndFantasy(SciFiAndFantasy)
        case lifestyleAndHome
        case selfDevelopment(SelfDevelopment)
        case comicsAndGraphicNovels(ComicsAndGraphicNovels)
        case computersAndInternet(ComputersAndInternet)
        case cookbooksFoodAndWine(CookbooksFoodAndWine)
        case professionalAndTechnical(ProfessionalAndTechnical)
        case parenting
        case fictionAndLiterature(FictionAndLiterature)
        case mysteriesAndThrillers(MysteryAndThrillers)
        case reference(Reference)
        case politicsAndCurrentEvents
        case sportsAndOutdoors(SportsAndOutdoors)
        case communicationsandMedia(CommunicationsAndMedia)
        case kids(Kids)
        case youngAdult(YoungAdult)
        case militaryAndWarfare
        
        var rawValue: String {
            switch self {
                case .nonfiction(let subject): return subject.rawValue
                case .romance(let genre): return genre.rawValue
                case .travelAndAdventure(let subject): return subject.rawValue
                case .artsAndEntertainment(let subject): return subject.rawValue
                case .biographiesAndMemoirs(let subject): return subject.rawValue
                case .businessAndPersonalFinance(let subject): return subject.rawValue
                case .childrenAndTeens(let subject): return subject.rawValue
                case .humor: return "Books|Humor"
                case .history(let subject): return subject.rawValue
                case .religionAndSpirituality(let subject): return subject.rawValue
                case .scienceAndNature(let subject): return subject.rawValue
                case .sciFiAndFantasy(let genre): return genre.rawValue
                case .lifestyleAndHome: return "Books|Lifestyle & Home"
                case .selfDevelopment(let subject): return subject.rawValue
                case .comicsAndGraphicNovels(let genre): return genre.rawValue
                case .computersAndInternet(let subject): return subject.rawValue
                case .cookbooksFoodAndWine(let subject): return subject.rawValue
                case .professionalAndTechnical(let subject): return subject.rawValue
                case .parenting: return "Books|Parenting"
                case .fictionAndLiterature(let genre): return genre.rawValue
                case .mysteriesAndThrillers(let genre): return genre.rawValue
                case .reference(let subject): return subject.rawValue
                case .politicsAndCurrentEvents: return "Books|Politics & Current Events"
                case .sportsAndOutdoors(let subject): return subject.rawValue
                case .communicationsandMedia(let subject): return subject.rawValue
                case .kids(let subject): return subject.rawValue
                case .youngAdult(let subject): return subject.rawValue
                case .militaryAndWarfare: return "Books|Military & Warfare"
            }
        }
        
        enum ComputersAndInternet: String {
            case computers = "Books|Computers & Internet|Computers"
            case databases = "Books|Computers & Internet|Databases"
            case digitalMedia = "Books|Computers & Internet|Digital Media"
            case internet = "Books|Computers & Internet|Internet"
            case network = "Books|Computers & Internet|Network"
            case operatingSystems = "Books|Computers & Internet|Operating Systems"
            case programming = "Books|Computers & Internet|Programming"
            case software = "Books|Computers & Internet|Software"
            case systemAdministration = "Books|Computers & Internet|System Administration"
        }
        
        enum CookbooksFoodAndWine: String {
            case culinaryArts = "Books|Cookbooks, Food & Wine|Culinary Arts"
            case beverages = "Books|Cookbooks, Food & Wine|Beverages"
            case coursesAndDishes = "Books|Cookbooks, Food & Wine|Courses & Dishes"
            case specialDiet = "Books|Cookbooks, Food & Wine|Special Diet"
            case specialOccasions = "Books|Cookbooks, Food & Wine|Special Occasions"
            case wineMethods = "Books|Cookbooks, Food & Wine|Methods"
            case wineReference = "Books|Cookbooks, Food & Wine|Reference"
            case regionalAndEthnic = "Books|Cookbooks, Food & Wine|Regional & Ethnic"
            case specificIngredients = "Books|Cookbooks, Food & Wine|Specific Ingredients"
            
        }
        
        enum History: String {
            case africa = "Books|History|Africa"
            case americas = "Books|History|Americas"
            case ancient = "Books|History|Ancient"
            case asia = "Books|History|Asia"
            case australiaAndOceania = "Books|History|Australia & Oceania"
            case europe = "Books|History|Europe"
            case latinAmerica = "Books|History|Latin America"
            case middleEast = "Books|History|Middle East"
            case military = "Books|History|Military"
            case unitedStates = "Books|History|United States"
            case world = "Books|History|World"
        }
        
        enum ChildrenAndTeens {
            case children(Children)
            
            var rawValue: String {
                switch self {
                    case .children(let subject): return subject.rawValue
                }
            }
            
            enum Children: String {
                case fiction = "Books|Children & Teens|Children's Fiction"
                case nonfiction = "Books|Children & Teens|Children's Nonfiction"
            }
        }
        
        enum SelfDevelopment: String {
            case spirituality = "Books|Self-Development|Spirituality"
            case healthAndFitness = "Books|Self-Development|Health & Fitness"
            case psychology = "Books|Self-Development|Psychology"
            case selfImprovement = "Books|Self-Development|Self-Improvement"
            case dietAndNutrition = "Books|Self-Development|Diet & Nutrition"
        }
        
        enum TravelAndAdventure: String {
            case africa = "Books|Travel & Adventure|Africa"
            case asia = "Books|Travel & Adventure|Asia"
            case specialtyTravel = "Books|Travel & Adventure|Specialty Travel"
            case canada = "Books|Travel & Adventure|Canada"
            case caribbean = "Books|Travel & Adventure|Caribbean"
            case latinAmerica = "Books|Travel & Adventure|Latin America"
            case essaysandMemoirs = "Books|Travel & Adventure|Essays & Memoirs"
            case europe = "Books|Travel & Adventure|Europe"
            case middleEast = "Books|Travel & Adventure|Middle East"
            case unitedStates = "Books|Travel & Adventure|United States"
        }
        
        enum CommunicationsAndMedia: String {
            case broadcasting = "Books|Communications & Media|Broadcasting"
            case digitalMedia = "Books|Communications & Media|Digital Media"
            case journalism = "Books|Communications & Media|Journalism"
            case photojournalism = "Books|Communications & Media|Photojournalism"
            case print = "Books|Communications & Media|Print"
            case speech = "Books|Communications & Media|Speech"
            case writing = "Books|Communications & Media|Writing"
        }
        
        enum BiographiesAndMemoirs: String {
            case artsAndEntertainment = "Books|Biographies & Memoirs|Arts & Entertainment"
            case business = "Books|Biographies & Memoirs|Business"
            case culinary = "Books|Biographies & Memoirs|Culinary"
            case gayAndLesbian = "Books|Biographies & Memoirs|Gay & Lesbian"
            case historical = "Books|Biographies & Memoirs|Historical"
            case literary = "Books|Biographies & Memoirs|Literary"
            case mediaAndJournalism = "Books|Biographies & Memoirs|Media & Journalism"
            case military = "Books|Biographies & Memoirs|Military"
            case politics = "Books|Biographies & Memoirs|Politics"
            case religious = "Books|Biographies & Memoirs|Religious"
            case scienceAndTechnology = "Books|Biographies & Memoirs|Science & Technology"
            case sports = "Books|Biographies & Memoirs|Sports"
            case women = "Books|Biographies & Memoirs|Women"
        }
        
        enum SportsAndOutdoors: String {
            case baseball = "Books|Sports & Outdoors|Baseball"
            case basketball = "Books|Sports & Outdoors|Basketball"
            case coaching = "Books|Sports & Outdoors|Coaching"
            case extremeSports = "Books|Sports & Outdoors|Extreme Sports"
            case football = "Books|Sports & Outdoors|Football"
            case golf = "Books|Sports & Outdoors|Golf"
            case hockey = "Books|Sports & Outdoors|Hockey"
            case mountaineering = "Books|Sports & Outdoors|Mountaineering"
            case outdoors = "Books|Sports & Outdoors|Outdoors"
            case racketSports = "Books|Sports & Outdoors|Racket Sports"
            case reference = "Books|Sports & Outdoors|Reference"
            case soccer = "Books|Sports & Outdoors|Soccer"
            case training = "Books|Sports & Outdoors|Training"
            case wterSports = "Books|Sports & Outdoors|Water Sports"
            case winterSports = "Books|Sports & Outdoors|Winter Sports"
            case boxing = "Books|Sports & Outdoors|Boxing"
            case cricket = "Books|Sports & Outdoors|Cricket"
            case cycling = "Books|Sports & Outdoors|Cycling"
            case equestrian = "Books|Sports & Outdoors|Equestrian"
            case martialArtsAndSelfDefense = "Books|Sports & Outdoors|Martial Arts & Self Defense"
            case motorSports = "Books|Sports & Outdoors|Motor Sports"
            case rugby = "Books|Sports & Outdoors|Rugby"
            case running = "Books|Sports & Outdoors|Running"
        }
        
        enum Kids {
            case animals
            case basicConcepts(BasicConcepts)
            case biography
            case careersAndOccupations
            case computersAndTechnology
            case cookingAndFood
            case artsAndEntertainment(ArtsAndEntertainment)
            case family
            case fiction(Fiction)
            case gamesAndActivities
            case generalNonfiction
            case health
            case history
            case holidaysAndCelebrations(HolidaysAndCelebrations)
            case humor(Humor)
            case poetry
            case learningToRead(LearningToRead)
            case nurseryRhymes
            case government
            case reference
            case religion
            case scienceAndNature
            case socialIssues
            case socialStudies
            case sportsAndRecreation
            case transportation
            
            var rawValue: String {
                switch self {
                    case .animals: return "Books|Kids|Animals"
                    case .basicConcepts(let subject): return subject.rawValue
                    case .biography: return "Books|Kids|Biography"
                    case .careersAndOccupations: return "Books|Kids|Careers & Occupations"
                    case .computersAndTechnology: return "Books|Kids|Computers & Technology"
                    case .cookingAndFood: return "Books|Kids|Cooking & Food"
                    case .artsAndEntertainment(let subject): return subject.rawValue
                    case .family: return "Books|Kids|Family"
                    case .fiction(let genre): return genre.rawValue
                    case .gamesAndActivities: return "Books|Kids|Games & Activities"
                    case .generalNonfiction: return "Books|Kids|General Nonfiction"
                    case .health: return "Books|Kids|Health"
                    case .history: return "Books|Kids|History"
                    case .holidaysAndCelebrations(let subject): return subject.rawValue
                    case .humor(let subject): return subject.rawValue
                    case .poetry: return "Books|Kids|Poetry"
                    case .learningToRead(let subject): return subject.rawValue
                    case .nurseryRhymes: return "Books|Kids|Nursery Rhymes"
                    case .government: return "Books|Kids|Government"
                    case .reference: return "Books|Kids|Reference"
                    case .religion: return "Books|Kids|Religion"
                    case .scienceAndNature: return "Books|Kids|Science & Nature"
                    case .socialIssues: return "Books|Kids|Social Issues"
                    case .socialStudies: return "Books|Kids|Social Studies"
                    case .sportsAndRecreation: return "Books|Kids|Sports & Recreation"
                    case .transportation: return "Books|Kids|Transportation"
                }
            }
            
            enum ArtsAndEntertainment: String {
                case art = "Books|Kids|Arts & Entertainment|Art"
                case crafts = "Books|Kids|Arts & Entertainment|Crafts"
                case music = "Books|Kids|Arts & Entertainment|Music"
                case performingArts = "Books|Kids|Arts & Entertainment|Performing Arts"
            }
            
            enum BasicConcepts: String {
                case alphabet = "Books|Kids|Basic Concepts|Alphabet"
                case body = "Books|Kids|Basic Concepts|Body"
                case colors = "Books|Kids|Basic Concepts|Colors"
                case countingAndNumbers = "Books|Kids|Basic Concepts|Counting & Numbers"
                case dateAndTime = "Books|Kids|Basic Concepts|Date & Time"
                case general = "Books|Kids|Basic Concepts|General"
                case money = "Books|Kids|Basic Concepts|Money"
                case opposites = "Books|Kids|Basic Concepts|Opposites"
                case seasons = "Books|Kids|Basic Concepts|Seasons"
                case sensesAndSensation = "Books|Kids|Basic Concepts|Senses & Sensation"
                case sizeAndShape = "Books|Kids|Basic Concepts|Size & Shape"
                case sounds = "Books|Kids|Basic Concepts|Sounds"
                case words = "Books|Kids|Basic Concepts|Words"
            }
            
            enum Fiction: String {
                case actionAndAdventure = "Books|Kids|Fiction|Action & Adventure"
                case animals = "Books|Kids|Fiction|Animals"
                case classics = "Books|Kids|Fiction|Classics"
                case comicsAndGraphicNovels = "Books|Kids|Fiction|Comics & Graphic Novels"
                case FculturePlacesAndPeople = "Books|Kids|Fiction|Culture, Places & People"
                case familyAndRelationships = "Books|Kids|Fiction|Family & Relationships"
                case fantasy = "Books|Kids|Fiction|Fantasy"
                case fairyTalesMythsAndFables = "Books|Kids|Fiction|Fairy Tales, Myths & Fables"
                case favoriteCharacters = "Books|Kids|Fiction|Favorite Characters"
                case historical = "Books|Kids|Fiction|Historical"
                case holidaysAndCelebrations = "Books|Kids|Fiction|Holidays & Celebrations"
                case monstersAndGhosts = "Books|Kids|Fiction|Monsters & Ghosts"
                case mysteries = "Books|Kids|Fiction|Mysteries"
                case nature = "Books|Kids|Fiction|Nature"
                case religion = "Books|Kids|Fiction|Religion"
                case sciFi = "Books|Kids|Fiction|Sci-Fi"
                case socialIssues = "Books|Kids|Fiction|Social Issues"
                case sportsAndRecreation = "Books|Kids|Fiction|Sports & Recreation"
                case transportation = "Books|Kids|Fiction|Transportation"
            }
            
            enum HolidaysAndCelebrations: String {
                case birthdays = "Books|Kids|Holidays & Celebrations|Birthdays"
                case christmasAndAdvent = "Books|Kids|Holidays & Celebrations|Christmas & Advent"
                case easterAndLent = "Books|Kids|Holidays & Celebrations|Easter & Lent"
                case general = "Books|Kids|Holidays & Celebrations|General"
                case halloween = "Books|Kids|Holidays & Celebrations|Halloween"
                case hanukkah = "Books|Kids|Holidays & Celebrations|Hanukkah"
                case other = "Books|Kids|Holidays & Celebrations|Other"
                case passover = "Books|Kids|Holidays & Celebrations|Passover"
                case patrioticHolidays = "Books|Kids|Holidays & Celebrations|Patriotic Holidays"
                case ramadan = "Books|Kids|Holidays & Celebrations|Ramadan"
                case thanksgiving = "Books|Kids|Holidays & Celebrations|Thanksgiving"
                case valentinesDay = "Books|Kids|Holidays & Celebrations|Valentine's Day"
            }
            
            enum Humor: String {
                case jokesAndRiddles = "Books|Kids|Humor|Jokes & Riddles"
            }
            
            enum LearningToRead: String {
                case chapterBooks = "Books|Kids|Learning to Read|Chapter Books"
                case earlyReaders = "Books|Kids|Learning to Read|Early Readers"
                case intermediateReaders = "Books|Kids|Learning to Read|Intermediate Readers"
            }
        }
        
        enum YoungAdult {
            case animals
            case biography
            case careersAndOccupations
            case computersAndTechnology
            case cookingAndFood
            case artsAndEntertainment(ArtsAndEntertainment)
            case family
            case fiction(Fiction)
            case gamesAndActivities
            case generalNonfiction
            case health
            case history
            case holidaysAndCelebrations(HolidaysAndCelebrations)
            case humor(Humor)
            case poetry
            case politicsAndGovernment
            case reference
            case religion
            case scienceAndNature
            case comingOfAge
            case socialStudies
            case sportsAndRecreation
            case transportation
            
            var rawValue: String {
                switch self {
                    case .animals: return "Books|Young Adult|Animals"
                    case .biography: return "Books|Young Adult|Biography"
                    case .careersAndOccupations: return "Books|Young Adult|Careers & Occupations"
                    case .computersAndTechnology: return  "Books|Young Adult|Computers & Technology"
                    case .cookingAndFood: return "Books|Young Adult|Cooking & Food"
                    case .artsAndEntertainment(let subject): return subject.rawValue
                    case .family: return "Books|Young Adult|Family"
                    case .fiction(let genre): return genre.rawValue
                    case .gamesAndActivities: return  "Books|Young Adult|Games & Activities"
                    case .generalNonfiction: return "Books|Young Adult|General Nonfiction"
                    case .health: return "Books|Young Adult|Health"
                    case .history: return "Books|Young Adult|History"
                    case .holidaysAndCelebrations(let subject): return subject.rawValue
                    case .humor(let subject): return subject.rawValue
                    case .poetry: return "Books|Young Adult|Poetry"
                    case .politicsAndGovernment: return "Books|Young Adult|Politics & Government"
                    case .reference: return "Books|Young Adult|Reference"
                    case .religion: return "Books|Young Adult|Religion"
                    case .scienceAndNature: return "Books|Young Adult|Science & Nature"
                    case .comingOfAge: return "Books|Young Adult|Coming of Age"
                    case .socialStudies: return "Books|Young Adult|Social Studies"
                    case .sportsAndRecreation: return "Books|Young Adult|Sports & Recreation"
                    case .transportation: return "Books|Young Adult|Transportation"
                }
            }
            
            enum ArtsAndEntertainment: String {
                case art = "Books|Young Adult|Arts & Entertainment|Art"
                case crafts = "Books|Young Adult|Arts & Entertainment|Crafts"
                case music = "Books|Young Adult|Arts & Entertainment|Music"
                case performingArts = "Books|Young Adult|Arts & Entertainment|Performing Arts"
            }
            
            enum Fiction: String {
                case actionAndAdventure = "Books|Young Adult|Fiction|Action & Adventure"
                case animals = "Books|Young Adult|Fiction|Animals"
                case classics = "Books|Young Adult|Fiction|Classics"
                case comicsAndGraphicNovels = "Books|Young Adult|Fiction|Comics & Graphic Novels"
                case culturePlacesAndPeople = "Books|Young Adult|Fiction|Culture, Places & People"
                case dystopian = "Books|Young Adult|Fiction|Dystopian"
                case familyAndRelationships = "Books|Young Adult|Fiction|Family & Relationships"
                case fantasy = "Books|Young Adult|Fiction|Fantasy"
                case fairyTalesMythsAndFables = "Books|Young Adult|Fiction|Fairy Tales, Myths & Fables"
                case favoriteCharacters = "Books|Young Adult|Fiction|Favorite Characters"
                case Yhistorical = "Books|Young Adult|Fiction|Historical"
                case holidaysAndCelebrations = "Books|Young Adult|Fiction|Holidays & Celebrations"
                case horrorMonstersAndGhosts = "Books|Young Adult|Fiction|Horror, Monsters & Ghosts"
                case crimeAndMystery = "Books|Young Adult|Fiction|Crime & Mystery"
                case nature = "Books|Young Adult|Fiction|Nature"
                case religion = "Books|Young Adult|Fiction|Religion"
                case romance = "Books|Young Adult|Fiction|Romance"
                case sciFi = "Books|Young Adult|Fiction|Sci-Fi"
                case comingOfAge = "Books|Young Adult|Fiction|Coming of Age"
                case sportsAndRecreation = "Books|Young Adult|Fiction|Sports & Recreation"
                case transportation = "Books|Young Adult|Fiction|Transportation"
            }
            
            enum HolidaysAndCelebrations: String {
                case birthdays = "Books|Young Adult|Holidays & Celebrations|Birthdays"
                case christmasAndAdvent = "Books|Young Adult|Holidays & Celebrations|Christmas & Advent"
                case easterAndLent = "Books|Young Adult|Holidays & Celebrations|Easter & Lent"
                case general = "Books|Young Adult|Holidays & Celebrations|General"
                case halloween = "Books|Young Adult|Holidays & Celebrations|Halloween"
                case hanukkah = "Books|Young Adult|Holidays & Celebrations|Hanukkah"
                case oher = "Books|Young Adult|Holidays & Celebrations|Other"
                case passover = "Books|Young Adult|Holidays & Celebrations|Passover"
                case patrioticHolidays = "Books|Young Adult|Holidays & Celebrations|Patriotic Holidays"
                case ramadan = "Books|Young Adult|Holidays & Celebrations|Ramadan"
                case thanksgiving = "Books|Young Adult|Holidays & Celebrations|Thanksgiving"
                case valentinesDay = "Books|Young Adult|Holidays & Celebrations|Valentine's Day"
            }
            
            enum Humor: String {
                case jokesAndRiddles = "Books|Young Adult|Humor|Jokes & Riddles"
            }
        }
        
        enum ArtsAndEntertainment {
            case theater
            case games
            case music
            case performingArts
            case photography
            case dance
            case fashion
            case film
            case interiorDesign
            case mediaArts
            case radio
            case tv
            case visualArts
            case artAndArchitecture(ArtAndArchitecture)
            case artHistory
            case design
            
            enum ArtAndArchitecture: String {
                case urbanPlanning = "Books|Arts & Entertainment|Art & Architecture|Urban Planning"
            }
            
            var rawValue: String {
                switch self {
                    case .theater: return "Books|Arts & Entertainment|Theater"
                    case .games: return "Books|Arts & Entertainment|Games"
                    case .music: return "Books|Arts & Entertainment|Music"
                    case .performingArts: return "Books|Arts & Entertainment|Performing Arts"
                    case .photography: return "Books|Arts & Entertainment|Photography"
                    case .dance: return "Books|Arts & Entertainment|Dance"
                    case .fashion: return "Books|Arts & Entertainment|Fashion"
                    case .film: return "Books|Arts & Entertainment|Film"
                    case .interiorDesign: return "Books|Arts & Entertainment|Interior Design"
                    case .mediaArts: return "Books|Arts & Entertainment|Media Arts"
                    case .radio: return "Books|Arts & Entertainment|Radio"
                    case .tv: return "Books|Arts & Entertainment|TV"
                    case .visualArts: return "Books|Arts & Entertainment|Visual Arts"
                    case .artAndArchitecture(let subject): return subject.rawValue
                    case .artHistory: return "Books|Arts & Entertainment|Art History"
                    case .design: return "Books|Arts & Entertainment|Design"
                }
            }
        }
        
        enum BusinessAndPersonalFinance: String {
            case industriesAndProfessions = "Books|Business & Personal Finance|Industries & Professions"
            case marketingandSales = "Books|Business & Personal Finance|Marketing & Sales"
            case smallBusinessAndEntrepreneurship = "Books|Business & Personal Finance|Small Business & Entrepreneurship"
            case personalFinance = "Books|Business & Personal Finance|Personal Finance"
            case reference = "Books|Business & Personal Finance|Reference"
            case careers = "Books|Business & Personal Finance|Careers"
            case economics = "Books|Business & Personal Finance|Economics"
            case investing = "Books|Business & Personal Finance|Investing"
            case finance = "Books|Business & Personal Finance|Finance"
            case managementAndLeadership = "Books|Business & Personal Finance|Management & Leadership"
            case accounting = "Books|Business & Personal Finance|Accounting"
            case hospitality = "Books|Business & Personal Finance|Hospitality"
            case realEstate = "Books|Business & Personal Finance|Real Estate"
        }
        
        enum Humor: String {
            case jokesandRiddles = "Books|Humor|Jokes & Riddles"
        }
        
        enum ReligionAndSpirituality: String {
            case bibleStudies = "Books|Religion & Spirituality|Bible Studies"
            case buddhism = "Books|Religion & Spirituality|Buddhism"
            case christianity = "Books|Religion & Spirituality|Christianity"
            case hinduism = "Books|Religion & Spirituality|Hinduism"
            case islam = "Books|Religion & Spirituality|Islam"
            case judaism = "Books|Religion & Spirituality|Judaism"
            case bibles = "Books|Religion & Spirituality|Bibles"
            case comparativeReligion = "Books|Religion & Spirituality|Comparative Religion"
        }
        
        enum MysteryAndThrillers: String {
            case hardBoiled = "Books|Mysteries & Thrillers|Hard-Boiled"
            case historical = "Books|Mysteries & Thrillers|Historical"
            case policeProcedural = "Books|Mysteries & Thrillers|Police Procedural"
            case shortStories = "Books|Mysteries & Thrillers|Short Stories"
            case britishDetectives = "Books|Mysteries & Thrillers|British Detectives"
            case womenSleuths = "Books|Mysteries & Thrillers|Women Sleuths"
            case cozy = "Books|Mysteries & Thrillers|Cozy"
        }
        
        enum SciFiAndFantasy {
            case scienceFiction
            case scienceFictionAndLiterature(ScienceFictionAndLiterature)
            case fantasy(Fantasy)
            
            enum ScienceFictionAndLiterature: String {
                case adventure = "Books|Sci-Fi & Fantasy|Science Fiction & Literature|Adventure"
                case highTech = "Books|Sci-Fi & Fantasy|Science Fiction & Literature|High Tech"
                case shortStories = "Books|Sci-Fi & Fantasy|Science Fiction & Literature|Short Stories"
            }
            
            enum Fantasy: String {
                case contemporary = "Books|Sci-Fi & Fantasy|Fantasy|Contemporary"
                case epic = "Books|Sci-Fi & Fantasy|Fantasy|Epic"
                case historical = "Books|Sci-Fi & Fantasy|Fantasy|Historical"
                case paranormal = "Books|Sci-Fi & Fantasy|Fantasy|Paranormal"
                case shortStories = "Books|Sci-Fi & Fantasy|Fantasy|Short Stories"
                case urban = "Books|Sci-Fi & Fantasy|Fantasy|Urban"
            }
            
            var rawValue: String {
                switch self {
                    case .scienceFiction: return "Science Fiction"
                    case .scienceFictionAndLiterature(let genre): return genre.rawValue
                    case .fantasy(let genre): return genre.rawValue
                }
            }
        }
        
        enum PoliticalAndCurrentEvents: String {
            case currentEvents = "Books|Politics & Current Events|Current Events"
            case foreignPolicyAndInternationalRelations = "Books|Politics & Current Events|Foreign Policy & International Relations"
            case localGovernment = "Books|Politics & Current Events|Local Government"
            case nationalGovernment = "Books|Politics & Current Events|National Government"
            case politicalScience = "Books|Politics & Current Events|Political Science"
            case publicAdministration = "Books|Politics & Current Events|Public Administration"
            case worldAffairs = "Books|Politics & Current Events|World Affairs"
        }
        
        enum Reference {
            case almanacsAndYearbooks
            case atlasesAndMaps
            case catalogsAndDirectories
            case consumerGuides
            case dictionariesAndThesauruses
            case encyclopedias
            case etiquette
            case quotations
            case wordsAndLanguage
            case witing
            case studyAids
            case manuals
            case foreignLanguages(ForeignLanguages)
            
            var rawValue: String {
                switch self {
                    case .almanacsAndYearbooks: return "Books|Reference|Almanacs & Yearbooks"
                    case .atlasesAndMaps: return "Books|Reference|Atlases & Maps"
                    case .catalogsAndDirectories: return "Books|Reference|Catalogs & Directories"
                    case .consumerGuides: return "Books|Reference|Consumer Guides"
                    case .dictionariesAndThesauruses: return "Books|Reference|Dictionaries & Thesauruses"
                    case .encyclopedias: return "Books|Reference|Encyclopedias"
                    case .etiquette: return "Books|Reference|Etiquette"
                    case .quotations: return "Books|Reference|Quotations"
                    case .wordsAndLanguage: return "Books|Reference|Words & Language"
                    case .witing: return "Books|Reference|Writing"
                    case .studyAids: return "Books|Reference|Study Aids"
                    case .manuals: return "Books|Reference|Manuals"
                    case .foreignLanguages(let subject): return subject.rawValue
                }
            }
            
            enum ForeignLanguages: String {
                case arabic = "Books|Reference|Foreign Languages|Arabic"
                case bilingualEditions = "Books|Reference|Foreign Languages|Bilingual Editions"
                case africanLanguages = "Books|Reference|Foreign Languages|African Languages"
                case ancientLanguages = "Books|Reference|Foreign Languages|Ancient Languages"
                case chinese = "Books|Reference|Foreign Languages|Chinese"
                case english = "Books|Reference|Foreign Languages|English"
                case french = "Books|Reference|Foreign Languages|French"
                case german = "Books|Reference|Foreign Languages|German"
                case hebrew = "Books|Reference|Foreign Languages|Hebrew"
                case hindi = "Books|Reference|Foreign Languages|Hindi"
                case italian = "Books|Reference|Foreign Languages|Italian"
                case japanese = "Books|Reference|Foreign Languages|Japanese"
                case korean = "Books|Reference|Foreign Languages|Korean"
                case linguistics = "Books|Reference|Foreign Languages|Linguistics"
                case otherLanguages = "Books|Reference|Foreign Languages|Other Languages"
                case portuguese = "Books|Reference|Foreign Languages|Portuguese"
                case russian = "Books|Reference|Foreign Languages|Russian"
                case spanish = "Books|Reference|Foreign Languages|Spanish"
                case speechPathology = "Books|Reference|Foreign Languages|Speech Pathology"
            }
        }
        
        enum Romance: String {
            case eroticRomance = "Books|Romance|Erotic Romance"
            case contemporary = "Books|Romance|Contemporary"
            case paranormal = "Books|Romance|Paranormal"
            case historical = "Books|Romance|Historical"
            case shortStories = "Books|Romance|Short Stories"
            case suspense = "Books|Romance|Suspense"
            case western = "Books|Romance|Western"
            case newAdult = "Books|Romance|New Adult"
            case romanticComedy = "Books|Romance|Romantic Comedy"
            case gayAndLesbian = "Books|Romance|Gay & Lesbian"
            case inspirational = "Books|Romance|Inspirational"
            case holiday = "Books|Romance|Holiday"
            case wholesome = "Books|Romance|Wholesome"
            case military = "Books|Romance|Military"
            case multicultural = "Books|Romance|Multicultural"
        }
        
        enum FictionAndLiterature: String {
            case actionAndAdventure = "Books|Fiction & Literature|Action & Adventure"
            case africanAmerican = "Books|Fiction & Literature|African American"
            case religious = "Books|Fiction & Literature|Religious"
            case classics = "Books|Fiction & Literature|Classics"
            case erotica = "Books|Fiction & Literature|Erotica"
            case gay = "Books|Fiction & Literature|Gay"
            case ghost = "Books|Fiction & Literature|Ghost"
            case historical = "Books|Fiction & Literature|Historical"
            case horror = "Books|Fiction & Literature|Horror"
            case literary = "Books|Fiction & Literature|Literary"
            case shortStories = "Books|Fiction & Literature|Short Stories"
            case literaryCriticism = "Books|Fiction & Literature|Literary Criticism"
            case poetry = "Books|Fiction & Literature|Poetry"
            case essays = "Books|Fiction & Literature|Essays"
            case anthologies = "Books|Fiction & Literature|Anthologies"
            case comparativeLiterature = "Books|Fiction & Literature|Comparative Literature"
            case drama = "Books|Fiction & Literature|Drama"
            case fairyTalesMythsAndFables = "Books|Fiction & Literature|Fairy Tales, Myths & Fables"
            case family = "Books|Fiction & Literature|Family"
            case lightNovels = "Books|Fiction & Literature|Light Novels"
        }
        
        enum ScienceAndNature {
            case nature
            case astronomy
            case chemistry
            case earthSciences
            case essays
            case history
            case lifeSciences
            case physics
            case reference
            case agriculture
            case atmosphere
            case biology
            case ecology
            case environment
            case geography
            case geology
            case mathematics(Mathematics)
            
            var rawValue: String {
                switch self {
                    case .nature: return "Books|Science & Nature|Nature"
                    case .astronomy: return "Books|Science & Nature|Astronomy"
                    case .chemistry: return "Books|Science & Nature|Chemistry"
                    case .earthSciences: return "Books|Science & Nature|Earth Sciences"
                    case .essays: return "Books|Science & Nature|Essays"
                    case .history: return "Books|Science & Nature|History"
                    case .lifeSciences: return "Books|Science & Nature|Life Sciences"
                    case .physics: return "Books|Science & Nature|Physics"
                    case .reference: return "Books|Science & Nature|Reference"
                    case .agriculture: return "Books|Science & Nature|Agriculture"
                    case .atmosphere: return "Books|Science & Nature|Atmosphere"
                    case .biology: return "Books|Science & Nature|Biology"
                    case .ecology: return "Books|Science & Nature|Ecology"
                    case .environment: return "Books|Science & Nature|Environment"
                    case .geography: return "Books|Science & Nature|Geography"
                    case .geology: return "Books|Science & Nature|Geology"
                    case .mathematics(let subject): return subject.rawValue
                }
            }
            
            enum Mathematics: String {
                case advancedMathematics = "Books|Science & Nature|Mathematics|Advanced Mathematics"
                case algebra = "Books|Science & Nature|Mathematics|Algebra"
                case arithmetic = "Books|Science & Nature|Mathematics|Arithmetic"
                case calculus = "Books|Science & Nature|Mathematics|Calculus"
                case geometry = "Books|Science & Nature|Mathematics|Geometry"
                case statistics = "Books|Science & Nature|Mathematics|Statistics"
            }
        }
        
        enum LifestyleAndHome: String {
            case antiquesAndCollectibles = "Books|Lifestyle & Home|Antiques & Collectibles"
            case craftsAndHobbies = "Books|Lifestyle & Home|Crafts & Hobbies"
            case gardening = "Books|Lifestyle & Home|Gardening"
            case pets = "Books|Lifestyle & Home|Pets"
        }
        
        enum NonFiction {
            case familyAndRelationships(FamilyAndRelationships)
            case philosophy(Philosophy)
            case socialScience(SocialScience)
            case transportation
            case trueCrime
            
            var rawValue: String {
                switch self {
                    case .familyAndRelationships(let subject): return subject.rawValue
                    case .philosophy(let subject): return subject.rawValue
                    case .socialScience(let subject): return subject.rawValue
                    case .transportation: return "Books|Nonfiction|Transportation"
                    case .trueCrime: return "Books|Nonfiction|True Crime"
                }
            }
            
            enum FamilyAndRelationships: String {
                case familyAndChildcare = "Books|Nonfiction|Family & Relationships|Family & Childcare"
                case loveAndRomance = "Books|Nonfiction|Family & Relationships|Love & Romance"
            }
            
            enum Philosophy: String {
                case aesthetics = "Books|Nonfiction|Philosophy|Aesthetics"
                case epistemology = "Books|Nonfiction|Philosophy|Epistemology"
                case ethics = "Books|Nonfiction|Philosophy|Ethics"
                case language = "Books|Nonfiction|Philosophy|Language"
                case logic = "Books|Nonfiction|Philosophy|Logic"
                case metaphysics = "Books|Nonfiction|Philosophy|Metaphysics"
                case political = "Books|Nonfiction|Philosophy|Political"
                case religion = "Books|Nonfiction|Philosophy|Religion"
                case politicalPhilosophy = "Books|Nonfiction|Philosophy|Political Philosophy"
                case philosophyOfLanguage = "Books|Nonfiction|Philosophy|Philosophy of Language"
                case philosophyOfReligion = "Books|Nonfiction|Philosophy|Philosophy of Religion"
            }
            
            enum SocialScience: String {
                case anthropology = "Books|Nonfiction|Social Science|Anthropology"
                case archaeology = "Books|Nonfiction|Social Science|Archaeology"
                case civics = "Books|Nonfiction|Social Science|Civics"
                case government = "Books|Nonfiction|Social Science|Government"
                case socialStudies = "Books|Nonfiction|Social Science|Social Studies"
                case socialWelfare = "Books|Nonfiction|Social Science|Social Welfare"
                case society = "Books|Nonfiction|Social Science|Society"
                case sociology = "Books|Nonfiction|Social Science|Sociology"
            }
        }
        
        enum ProfessionalAndTechnical {
            case design
            case education(Education)
            case engineering(Engineering)
            case law
            case medical(Medical)
            
            var rawValue: String {
                switch self {
                    case .design: return "Books|Professional & Technical|Design"
                    case .education(let subject): return subject.rawValue
                    case .engineering(let subject): return subject.rawValue
                    case .law: return "Books|Professional & Technical|Law"
                    case .medical(let subject): return subject.rawValue
                }
            }
            
            enum Education: String {
                case ProfessionalandTechnicalEducationLanguageArtsandDisciplines = "Books|Professional & Technical|Education|Language Arts & Disciplines"
            }
            enum Medical: String {
                case veterinary = "Books|Professional & Technical|Medical|Veterinary"
                case neuroscience = "Books|Professional & Technical|Medical|Neuroscience"
                case medicalImmunology = "Books|Professional & Technical|Medical|Immunology"
                case nursing = "Books|Professional & Technical|Medical|Nursing"
                case pharmacologyAndToxicology = "Books|Professional & Technical|Medical|Pharmacology & Toxicology"
                case anatomyAndPhysiology = "Books|Professional & Technical|Medical|Anatomy & Physiology"
                case medicalDentistry = "Books|Professional & Technical|Medical|Dentistry"
                case medicalEmergencyMedicine = "Books|Professional & Technical|Medical|Emergency Medicine"
                case genetics = "Books|Professional & Technical|Medical|Genetics"
                case psychiatry = "Books|Professional & Technical|Medical|Psychiatry"
                case radiology = "Books|Professional & Technical|Medical|Radiology"
                case alternativeMedicine = "Books|Professional & Technical|Medical|Alternative Medicine"
            }
            
            enum Engineering: String {
                case aeronautics = "Books|Professional & Technical|Engineering|Aeronautics"
                case chemicalAndPetroleumEngineering = "Books|Professional & Technical|Engineering|Chemical & Petroleum Engineering"
                case civilEngineering = "Books|Professional & Technical|Engineering|Civil Engineering"
                case computerScience = "Books|Professional & Technical|Engineering|Computer Science"
                case electricalEngineering = "Books|Professional & Technical|Engineering|Electrical Engineering"
                case environmentalEngineering = "Books|Professional & Technical|Engineering|Environmental Engineering"
                case mechanicalEngineering = "Books|Professional & Technical|Engineering|Mechanical Engineering"
                case powerResources = "Books|Professional & Technical|Engineering|Power Resources"
            }
        }
        
        enum ComicsAndGraphicNovels{
            case graphicNovels
            case manga(Manga)
            case comics
            
            var rawValue: String {
                switch self {
                    case .graphicNovels: return "Books|Comics & Graphic Novels|Graphic Novels"
                    case .manga(let genre): return genre.rawValue
                    case .comics: return "Books|Comics & Graphic Novels|Comics"
                }
            }
            
            enum Manga: String {
                case schoolDrama = "Books|Comics & Graphic Novels|Manga|School Drama"
                case humanDrama = "Books|Comics & Graphic Novels|Manga|Human Drama"
                case familyDrama = "Books|Comics & Graphic Novels|Manga|Family Drama"
                case boys = "Books|Comics & Graphic Novels|Manga|Boys"
                case men = "Books|Comics & Graphic Novels|Manga|Men"
                case girls = "Books|Comics & Graphic Novels|Manga|Girls"
                case women = "Books|Comics & Graphic Novels|Manga|Women"
                case other = "Books|Comics & Graphic Novels|Manga|Other"
                case yaoi = "Books|Comics & Graphic Novels|Manga|Yaoi"
                case comicEssays = "Books|Comics & Graphic Novels|Manga|Comic Essays"
                case action = "Books|Comics & Graphic Novels|Manga|Action"
                case comedy = "Books|Comics & Graphic Novels|Manga|Comedy"
                case erotica = "Books|Comics & Graphic Novels|Manga|Erotica"
                case fantasy = "Books|Comics & Graphic Novels|Manga|Fantasy"
                case fourCellManga = "Books|Comics & Graphic Novels|Manga|Four Cell Manga"
                case gayandLesbian = "Books|Comics & Graphic Novels|Manga|Gay & Lesbian"
                case hardBoiled = "Books|Comics & Graphic Novels|Manga|Hard-Boiled"
                case hroes = "Books|Comics & Graphic Novels|Manga|Heroes"
                case historicalFiction = "Books|Comics & Graphic Novels|Manga|Historical Fiction"
                case mecha = "Books|Comics & Graphic Novels|Manga|Mecha"
                case mystery = "Books|Comics & Graphic Novels|Manga|Mystery"
                case nonfiction = "Books|Comics & Graphic Novels|Manga|Nonfiction"
                case religious = "Books|Comics & Graphic Novels|Manga|Religious"
                case romance = "Books|Comics & Graphic Novels|Manga|Romance"
                case romanticComedy = "Books|Comics & Graphic Novels|Manga|Romantic Comedy"
                case scienceFiction = "Books|Comics & Graphic Novels|Manga|Science Fiction"
                case sports = "Books|Comics & Graphic Novels|Manga|Sports"
                case horror = "Books|Comics & Graphic Novels|Manga|Horror"
            }
        }
    }
    
    enum Audiobooks: String {
        case fiction = "Audiobooks|Fiction"
        case artsAndEntertainment = "Audiobooks|Arts & Entertainment"
        case biographiesAndMemoirs = "Audiobooks|Biographies & Memoirs"
        case businessAndPersonalFinance = "Audiobooks|Business & Personal Finance"
        case kidsAndYoungAdults = "Audiobooks|Kids & Young Adults"
        case classics = "Audiobooks|Classics"
        case comedy = "Audiobooks|Comedy"
        case dramaAndPoetry = "Audiobooks|Drama & Poetry"
        case speakersandStorytellers = "Audiobooks|Speakers & Storytellers"
        case history = "Audiobooks|History"
        case languages = "Audiobooks|Languages"
        case mysteriesandThrillers = "Audiobooks|Mysteries & Thrillers"
        case nonfiction = "Audiobooks|Nonfiction"
        case rligionAndSpirituality = "Audiobooks|Religion & Spirituality"
        case scienceAndNature = "Audiobooks|Science & Nature"
        case sciFiAndFantasy = "Audiobooks|Sci Fi & Fantasy"
        case selfDevelopment = "Audiobooks|Self-Development"
        case sportsAndOutdoors = "Audiobooks|Sports & Outdoors"
        case technology = "Audiobooks|Technology"
        case travelAndAdventure = "Audiobooks|Travel & Adventure"
        case romance = "Audiobooks|Romance"
        case latino = "Audiobooks|Audiobooks Latino"
        case news = "Audiobooks|News"
        case programsAndPerformances = "Audiobooks|Programs & Performances"
        case erotica = "Audiobooks|Erotica"
        case lightNovels = "Audiobooks|Light Novels"
    }
    
    enum Textbooks {
        case artsAndEntertainment(ArtsAndEntertainment)
        case biographiesandMemoirs
        case businessAndPersonalFinance(BusinessAndPersonalFinance)
        case childrenAndTeens(ChildrenAndTeens)
        case comicsAndGraphicNovels(ComicsAndGraphicNovels)
        case communicationsAndMedia(CommunicationsAndMedia)
        case computersAndInternet(ComputersAndInternet)
        case cookbooksFoodAndWine(CookbooksFoodAndWine)
        case engineering(Engineering)
        case fictionAndLiterature(FictionAndLiterature)
        case healthMindAndBody(HealthMindAndBody)
        case history(History)
        case humor
        case languageStudies(LanguageStudies)
        case lifestyleAndHome(LifeStyleAndHome)
        case mathematics(Mathematics)
        case medicine(Medicine)
        case nysteriesAndThrillers(MysteriesAndThrillers)
        case nonfiction(NonFiction)
        case parenting
        case philosophy(Philosophy)
        case politicsAndCurrentEvents(PoliticsAndCurrentEvents)
        case professionalAndTechnical(ProfessionalAndTechnical)
        case reference(Reference)
        case religionAndSpirituality(ReligionAndSpirtuality)
        case romance(Romance)
        case sciFiAndFantasy(SciFiAndFantasy)
        case scienceAndNature(ScienceAndNature)
        case socialScience(SocialScience)
        case sportsAndOutdoors(SportsAndOutdoors)
        case teachingAndLearning(TeachingAndLearning)
        case travelAndAdventure(TravelAndAdventure)
        case comicsAndGraphicNovelsComics
        case referenceManuals
        
        var rawValue: String {
            switch self {
                case .biographiesandMemoirs: return "Textbooks|Biographies & Memoirs"
                case .humor: return "Textbooks|Humor"
                case .parenting: return "Textbooks|Parenting"
                case .referenceManuals: return "Textbooks|Reference|Manuals"
                default: return ""
            }
        }
        
        enum ArtsAndEntertainment: String {
            case artAndArchitecture = "Textbooks|Arts & Entertainment|Art & Architecture"
            case artAndArchitectureUrbanPlanning = "Textbooks|Arts & Entertainment|Art & Architecture|Urban Planning"
            case artHistory = "Textbooks|Arts & Entertainment|Art History"
            case dance = "Textbooks|Arts & Entertainment|Dance"
            case design = "Textbooks|Arts & Entertainment|Design"
            case fashion = "Textbooks|Arts & Entertainment|Fashion"
            case film = "Textbooks|Arts & Entertainment|Film"
            case games = "Textbooks|Arts & Entertainment|Games"
            case interiorDesign = "Textbooks|Arts & Entertainment|Interior Design"
            case mediaArts = "Textbooks|Arts & Entertainment|Media Arts"
            case music = "Textbooks|Arts & Entertainment|Music"
            case peformingArts = "Textbooks|Arts & Entertainment|Performing Arts"
            case photography = "Textbooks|Arts & Entertainment|Photography"
            case theater = "Textbooks|Arts & Entertainment|Theater"
            case tv = "Textbooks|Arts & Entertainment|TV"
            case visualArts = "Textbooks|Arts & Entertainment|Visual Arts"
        }
        
        enum BusinessAndPersonalFinance: String {
            case accounting = "Textbooks|Business & Personal Finance|Accounting"
            case careers = "Textbooks|Business & Personal Finance|Careers"
            case economics = "Textbooks|Business & Personal Finance|Economics"
            case finance = "Textbooks|Business & Personal Finance|Finance"
            case hospitality = "Textbooks|Business & Personal Finance|Hospitality"
            case industriesAndProfessions = "Textbooks|Business & Personal Finance|Industries & Professions"
            case investing = "Textbooks|Business & Personal Finance|Investing"
            case managementAndLeadership = "Textbooks|Business & Personal Finance|Management & Leadership"
            case marketingAndSales = "Textbooks|Business & Personal Finance|Marketing & Sales"
            case personalFinance = "Textbooks|Business & Personal Finance|Personal Finance"
            case realEstate = "Textbooks|Business & Personal Finance|Real Estate"
            case reference = "Textbooks|Business & Personal Finance|Reference"
            case smallBusinessAndEntrepreneurship = "Textbooks|Business & Personal Finance|Small Business & Entrepreneurship"
        }
        
        enum ChildrenAndTeens: String {
            case fiction = "Textbooks|Children & Teens|Fiction"
            case nonfiction = "Textbooks|Children & Teens|Nonfiction"
        }
        
        enum ComicsAndGraphicNovels: String {
            case comics = "Textbooks|Comics & Graphic Novels|Comics"
            case graphicNovels = "Textbooks|Comics & Graphic Novels|Graphic Novels"
            case manga = "Textbooks|Comics & Graphic Novels|Manga"
        }
        enum CommunicationsAndMedia: String {
            case broadcasting = "Textbooks|Communications & Media|Broadcasting"
            case digitalMedia = "Textbooks|Communications & Media|Digital Media"
            case journalism = "Textbooks|Communications & Media|Journalism"
            case photojournalism = "Textbooks|Communications & Media|Photojournalism"
            case print = "Textbooks|Communications & Media|Print"
            case speech = "Textbooks|Communications & Media|Speech"
            case writing = "Textbooks|Communications & Media|Writing"
        }
        
        enum ComputersAndInternet: String {
            case computers = "Textbooks|Computers & Internet|Computers"
            case databases = "Textbooks|Computers & Internet|Databases"
            case digitalMedia = "Textbooks|Computers & Internet|Digital Media"
            case internet = "Textbooks|Computers & Internet|Internet"
            case network = "Textbooks|Computers & Internet|Network"
            case pperatingSystems = "Textbooks|Computers & Internet|Operating Systems"
            case programming = "Textbooks|Computers & Internet|Programming"
            case software = "Textbooks|Computers & Internet|Software"
            case systemAdministration = "Textbooks|Computers & Internet|System Administration"
        }
        
        enum CookbooksFoodAndWine: String {
            case beverages = "Textbooks|Cookbooks, Food & Wine|Beverages"
            case coursesAndDishes = "Textbooks|Cookbooks, Food & Wine|Courses & Dishes"
            case culinaryArts = "Textbooks|Cookbooks, Food & Wine|Culinary Arts"
            case methods = "Textbooks|Cookbooks, Food & Wine|Methods"
            case reference = "Textbooks|Cookbooks, Food & Wine|Reference"
            case regionalAndEthnic = "Textbooks|Cookbooks, Food & Wine|Regional & Ethnic"
            case specialDiet = "Textbooks|Cookbooks, Food & Wine|Special Diet"
            case specialOccasions = "Textbooks|Cookbooks, Food & Wine|Special Occasions"
            case specificIngredients = "Textbooks|Cookbooks, Food & Wine|Specific Ingredients"
        }
        
        enum Engineering: String {
            case aeronautics = "Textbooks|Engineering|Aeronautics"
            case chemicalAndPetroleumEngineering = "Textbooks|Engineering|Chemical & Petroleum Engineering"
            case civilEngineering = "Textbooks|Engineering|Civil Engineering"
            case computerScience = "Textbooks|Engineering|Computer Science"
            case electricalEngineering = "Textbooks|Engineering|Electrical Engineering"
            case environmentalEngineering = "Textbooks|Engineering|Environmental Engineering"
            case mechanicalEngineering = "Textbooks|Engineering|Mechanical Engineering"
            case powerResources = "Textbooks|Engineering|Power Resources"
        }
        
        enum FictionAndLiterature: String {
            case latino = "Textbooks|Fiction & Literature|Latino"
            case actionAndAdventure = "Textbooks|Fiction & Literature|Action & Adventure"
            case africanAmerican = "Textbooks|Fiction & Literature|African American"
            case anthologies = "Textbooks|Fiction & Literature|Anthologies"
            case classics = "Textbooks|Fiction & Literature|Classics"
            case comparativeLiterature = "Textbooks|Fiction & Literature|Comparative Literature"
            case erotica = "Textbooks|Fiction & Literature|Erotica"
            case gay = "Textbooks|Fiction & Literature|Gay"
            case ghost = "Textbooks|Fiction & Literature|Ghost"
            case historical = "Textbooks|Fiction & Literature|Historical"
            case horror = "Textbooks|Fiction & Literature|Horror"
            case literary = "Textbooks|Fiction & Literature|Literary"
            case literaryCriticism = "Textbooks|Fiction & Literature|Literary Criticism"
            case poetry = "Textbooks|Fiction & Literature|Poetry"
            case religious = "Textbooks|Fiction & Literature|Religious"
            case shortStories = "Textbooks|Fiction & Literature|Short Stories"
        }
        
        enum HealthMindAndBody: String {
            case fitness = "Textbooks|Health, Mind & Body|Fitness"
            case selfImprovement = "Textbooks|Health, Mind & Body|Self-Improvement"
        }
        
        enum History {
            case africa
            case americas(Americas)
            case HistoryAncient
            case HistoryAsia
            case HistoryAustraliaandOceania
            case HistoryEurope
            case HistoryMiddleEast
            case HistoryMilitary
            case HistoryWorld
            
            var rawValue: String {
                switch self {
                    case .africa: return "Textbooks|History|Africa"
                    case .americas(let subject): return subject.rawValue
                    case .HistoryAncient: return "Textbooks|History|Ancient"
                    case .HistoryAsia: return "Textbooks|History|Asia"
                    case .HistoryAustraliaandOceania: return "Textbooks|History|Australia & Oceania"
                    case .HistoryEurope: return "Textbooks|History|Europe"
                    case .HistoryMiddleEast: return "Textbooks|History|Middle East"
                    case .HistoryMilitary: return "Textbooks|History|Military"
                    case .HistoryWorld: return "Textbooks|History|World"
                }
            }
            
            enum Americas: String {
                case canada = "Textbooks|History|Americas|Canada"
                case latinAmerica = "Textbooks|History|Americas|Latin America"
                case unitedStates = "Textbooks|History|Americas|United States"
            }
        }
        
        enum LanguageStudies: String {
            case africanLanguages = "Textbooks|Language Studies|African Languages"
            case ancientLanguages = "Textbooks|Language Studies|Ancient Languages"
            case arabic = "Textbooks|Language Studies|Arabic"
            case bilingualEditions = "Textbooks|Language Studies|Bilingual Editions"
            case chinese = "Textbooks|Language Studies|Chinese"
            case english = "Textbooks|Language Studies|English"
            case french = "Textbooks|Language Studies|French"
            case german = "Textbooks|Language Studies|German"
            case hebrew = "Textbooks|Language Studies|Hebrew"
            case hindi = "Textbooks|Language Studies|Hindi"
            case indigenousLanguages = "Textbooks|Language Studies|Indigenous Languages"
            case italian = "Textbooks|Language Studies|Italian"
            case japanese = "Textbooks|Language Studies|Japanese"
            case korean = "Textbooks|Language Studies|Korean"
            case linguistics = "Textbooks|Language Studies|Linguistics"
            case otherLanguage = "Textbooks|Language Studies|Other Language"
            case portuguese = "Textbooks|Language Studies|Portuguese"
            case russian = "Textbooks|Language Studies|Russian"
            case spanish = "Textbooks|Language Studies|Spanish"
            case speechPathology = "Textbooks|Language Studies|Speech Pathology"
        }
        
        enum LifeStyleAndHome: String {
            case antiquesAndCollectibles = "Textbooks|Lifestyle & Home|Antiques & Collectibles"
            case craftsAndHobbies = "Textbooks|Lifestyle & Home|Crafts & Hobbies"
            case gardening = "Textbooks|Lifestyle & Home|Gardening"
            case pets = "Textbooks|Lifestyle & Home|Pets"
        }
        
        enum Mathematics: String {
            case advancedMathematics = "Textbooks|Mathematics|Advanced Mathematics"
            case algebra = "Textbooks|Mathematics|Algebra"
            case arithmetic = "Textbooks|Mathematics|Arithmetic"
            case calculus = "Textbooks|Mathematics|Calculus"
            case geometry = "Textbooks|Mathematics|Geometry"
            case statistics = "Textbooks|Mathematics|Statistics"
        }
        
        enum Medicine: String {
            case anatomyAndPhysiology = "Textbooks|Medicine|Anatomy & Physiology"
            case dentistry = "Textbooks|Medicine|Dentistry"
            case emergencyMedicine = "Textbooks|Medicine|Emergency Medicine"
            case genetics = "Textbooks|Medicine|Genetics"
            case immunology = "Textbooks|Medicine|Immunology"
            case neuroscience = "Textbooks|Medicine|Neuroscience"
            case nursing = "Textbooks|Medicine|Nursing"
            case tpharmacologyAndToxicology = "Textbooks|Medicine|Pharmacology & Toxicology"
            case psychiatry = "Textbooks|Medicine|Psychiatry"
            case psychology = "Textbooks|Medicine|Psychology"
            case radiology = "Textbooks|Medicine|Radiology"
            case veterinary = "Textbooks|Medicine|Veterinary"
        }
        
        enum MysteriesAndThrillers: String {
            case britishDetectives = "Textbooks|Mysteries & Thrillers|British Detectives"
            case hardBoiled = "Textbooks|Mysteries & Thrillers|Hard-Boiled"
            case historical = "Textbooks|Mysteries & Thrillers|Historical"
            case policeProcedural = "Textbooks|Mysteries & Thrillers|Police Procedural"
            case shortStories = "Textbooks|Mysteries & Thrillers|Short Stories"
            case womenSleuths = "Textbooks|Mysteries & Thrillers|Women Sleuths"
        }
        
        enum NonFiction: String {
            case familyAndRelationships = "Textbooks|Nonfiction|Family & Relationships"
            case transportation = "Textbooks|Nonfiction|Transportation"
            case trueCrime = "Textbooks|Nonfiction|True Crime"
        }
        
        enum Philosophy: String {
            case aesthetics = "Textbooks|Philosophy|Aesthetics"
            case epistemology = "Textbooks|Philosophy|Epistemology"
            case philosophyEthics = "Textbooks|Philosophy|Ethics"
            case philosophyOfLanguage = "Textbooks|Philosophy|Philosophy of Language"
            case logic = "Textbooks|Philosophy|Logic"
            case metaphysics = "Textbooks|Philosophy|Metaphysics"
            case politicalPhilosophy = "Textbooks|Philosophy|Political Philosophy"
            case philosophyOfReligion = "Textbooks|Philosophy|Philosophy of Religion"
        }
        
        enum PoliticsAndCurrentEvents: String {
            case currentEvents = "Textbooks|Politics & Current Events|Current Events"
            case foreignPolicyAndInternationalRelations = "Textbooks|Politics & Current Events|Foreign Policy & International Relations"
            case localGovernments = "Textbooks|Politics & Current Events|Local Governments"
            case nationalGovernments = "Textbooks|Politics & Current Events|National Governments"
            case politicalScience = "Textbooks|Politics & Current Events|Political Science"
            case publicAdministration = "Textbooks|Politics & Current Events|Public Administration"
            case worldAffairs = "Textbooks|Politics & Current Events|World Affairs"
        }
        
        enum ProfessionalAndTechnical: String {
            case design = "Textbooks|Professional & Technical|Design"
            case languageArtsAndDisciplines = "Textbooks|Professional & Technical|Language Arts & Disciplines"
            case engineering = "Textbooks|Professional & Technical|Engineering"
            case law = "Textbooks|Professional & Technical|Law"
            case medical = "Textbooks|Professional & Technical|Medical"
        }
        
        enum Reference: String {
            case almanacsAndYearbooks = "Textbooks|Reference|Almanacs & Yearbooks"
            case atlasesAndMaps = "Textbooks|Reference|Atlases & Maps"
            case catalogsAndDirectories = "Textbooks|Reference|Catalogs & Directories"
            case consumerGuides = "Textbooks|Reference|Consumer Guides"
            case dctionariesAndThesauruses = "Textbooks|Reference|Dictionaries & Thesauruses"
            case encyclopedias = "Textbooks|Reference|Encyclopedias"
            case etiquette = "Textbooks|Reference|Etiquette"
            case quotations = "Textbooks|Reference|Quotations"
            case studyAids = "Textbooks|Reference|Study Aids"
            case wordsandLanguage = "Textbooks|Reference|Words & Language"
            case referenceWriting = "Textbooks|Reference|Writing"
        }
        
        enum ReligionAndSpirtuality: String {
            case bibleStudies = "Textbooks|Religion & Spirituality|Bible Studies"
            case bibles = "Textbooks|Religion & Spirituality|Bibles"
            case buddhism = "Textbooks|Religion & Spirituality|Buddhism"
            case christianity = "Textbooks|Religion & Spirituality|Christianity"
            case comparativeReligion = "Textbooks|Religion & Spirituality|Comparative Religion"
            case hinduism = "Textbooks|Religion & Spirituality|Hinduism"
            case islam = "Textbooks|Religion & Spirituality|Islam"
            case judaism = "Textbooks|Religion & Spirituality|Judaism"
            case spirituality = "Textbooks|Religion & Spirituality|Spirituality"
        }
        
        enum Romance: String {
            case contemporary = "Textbooks|Romance|Contemporary"
            case eroticRomance = "Textbooks|Romance|Erotic Romance"
            case paranormal = "Textbooks|Romance|Paranormal"
            case historical = "Textbooks|Romance|Historical"
            case shortStories = "Textbooks|Romance|Short Stories"
            case suspense = "Textbooks|Romance|Suspense"
            case western = "Textbooks|Romance|Western"
        }
        
        enum SciFiAndFantasy {
            case fantasy(Fantasy)
            case scienceFiction
            case scienceFictionAndLiterature(ScienceFictionAndLiterature)
            
            var rawValue: String {
                switch self {
                    case .fantasy(let subject):
                        return subject.rawValue
                    case .scienceFiction: return  "Textbooks|Sci-Fi & Fantasy|Science Fiction"
                    case .scienceFictionAndLiterature(let subject):
                        return subject.rawValue
                }
            }
            enum Fantasy: String {
                case contemporary = "Textbooks|Sci-Fi & Fantasy|Fantasy|Contemporary"
                case epic = "Textbooks|Sci-Fi & Fantasy|Fantasy|Epic"
                case historical = "Textbooks|Sci-Fi & Fantasy|Fantasy|Historical"
                case paranormal = "Textbooks|Sci-Fi & Fantasy|Fantasy|Paranormal"
                case shortStories = "Textbooks|Sci-Fi & Fantasy|Fantasy|Short Stories"
            }
            
            enum ScienceFictionAndLiterature: String {
                case sadventure = "Textbooks|Sci-Fi & Fantasy|Science Fiction & Literature|Adventure"
                case highTech = "Textbooks|Sci-Fi & Fantasy|Science Fiction & Literature|High Tech"
                case shortStories = "Textbooks|Sci-Fi & Fantasy|Science Fiction & Literature|Short Stories"
            }
            
        }
        
        enum ScienceAndNature: String {
            case agriculture = "Textbooks|Science & Nature|Agriculture"
            case astronomy = "Textbooks|Science & Nature|Astronomy"
            case atmosphere = "Textbooks|Science & Nature|Atmosphere"
            case biology = "Textbooks|Science & Nature|Biology"
            case chemistry = "Textbooks|Science & Nature|Chemistry"
            case earthSciences = "Textbooks|Science & Nature|Earth Sciences"
            case ecology = "Textbooks|Science & Nature|Ecology"
            case environment = "Textbooks|Science & Nature|Environment"
            case essays = "Textbooks|Science & Nature|Essays"
            case geography = "Textbooks|Science & Nature|Geography"
            case geology = "Textbooks|Science & Nature|Geology"
            case history = "Textbooks|Science & Nature|History"
            case lifeSciences = "Textbooks|Science & Nature|Life Sciences"
            case tnature = "Textbooks|Science & Nature|Nature"
            case physics = "Textbooks|Science & Nature|Physics"
            case reference = "Textbooks|Science & Nature|Reference"
        }
        
        enum SocialScience {
            case anthropology
            case archaeology
            case civics
            case government
            case socialStudies
            case socialWelfare
            case sociology
            case society(Society)
            
            var rawValue: String {
                switch self {
                    case .anthropology: return "Textbooks|Social Science|Anthropology"
                    case .archaeology: return "Textbooks|Social Science|Archaeology"
                    case .civics: return "Textbooks|Social Science|Civics"
                    case .government: return "Textbooks|Social Science|Government"
                    case .socialStudies: return "Textbooks|Social Science|Social Studies"
                    case .socialWelfare: return "Textbooks|Social Science|Social Welfare"
                    case .sociology: return "Textbooks|Social Science|Sociology"
                    case .society(let subject): return subject.rawValue
                }
            }
            enum Society: String {
                case africanStudies = "Textbooks|Social Science|Society|African Studies"
                case americanStudies = "Textbooks|Social Science|Society|American Studies"
                case asiaPacificStudies = "Textbooks|Social Science|Society|Asia Pacific Studies"
                case crossCulturalStudies = "Textbooks|Social Science|Society|Cross-Cultural Studies"
                case europeanStudies = "Textbooks|Social Science|Society|European Studies"
                case immigrationandEmigration = "Textbooks|Social Science|Society|Immigration & Emigration"
                case indigenousStudies = "Textbooks|Social Science|Society|Indigenous Studies"
                case latinandCaribbeanStudies = "Textbooks|Social Science|Society|Latin & Caribbean Studies"
                case middleEasternStudies = "Textbooks|Social Science|Society|Middle Eastern Studies"
                case raceandEthnicityStudies = "Textbooks|Social Science|Society|Race & Ethnicity Studies"
                case sexualityStudies = "Textbooks|Social Science|Society|Sexuality Studies"
                case womensStudies = "Textbooks|Social Science|Society|Women's Studies"
            }
        }
        
        enum SportsAndOutdoors: String {
            case baseball = "Textbooks|Sports & Outdoors|Baseball"
            case basketball = "Textbooks|Sports & Outdoors|Basketball"
            case coaching = "Textbooks|Sports & Outdoors|Coaching"
            case equestrian = "Textbooks|Sports & Outdoors|Equestrian"
            case extremeSports = "Textbooks|Sports & Outdoors|Extreme Sports"
            case football = "Textbooks|Sports & Outdoors|Football"
            case golf = "Textbooks|Sports & Outdoors|Golf"
            case hockey = "Textbooks|Sports & Outdoors|Hockey"
            case motorSports = "Textbooks|Sports & Outdoors|Motor Sports"
            case mountaineering = "Textbooks|Sports & Outdoors|Mountaineering"
            case outdoors = "Textbooks|Sports & Outdoors|Outdoors"
            case racketSports = "Textbooks|Sports & Outdoors|Racket Sports"
            case reference = "Textbooks|Sports & Outdoors|Reference"
            case soccer = "Textbooks|Sports & Outdoors|Soccer"
            case training = "Textbooks|Sports & Outdoors|Training"
            case waterSports = "Textbooks|Sports & Outdoors|Water Sports"
            case winterSports = "Textbooks|Sports & Outdoors|Winter Sports"
        }
        
        enum TeachingAndLearning: String {
            case adultEducation = "Textbooks|Teaching & Learning|Adult Education"
            case curriculumAndTeaching = "Textbooks|Teaching & Learning|Curriculum & Teaching"
            case educationalLeadership = "Textbooks|Teaching & Learning|Educational Leadership"
            case educationalTechnology = "Textbooks|Teaching & Learning|Educational Technology"
            case familyandChildcare = "Textbooks|Teaching & Learning|Family & Childcare"
            case informationAndLibraryScience = "Textbooks|Teaching & Learning|Information & Library Science"
            case learningResources = "Textbooks|Teaching & Learning|Learning Resources"
            case psychologyAndResearch = "Textbooks|Teaching & Learning|Psychology & Research"
            case specialEducation = "Textbooks|Teaching & Learning|Special Education"
        }
        
        enum TravelAndAdventure {
            case africa
            case americas(Americas)
            case asia
            case caribbean
            case essaysandMemoirs
            case adventureEurope
            case middleEast
            case oceania
            case specialtyTravel
            
            var rawValue: String {
                switch self {
                    case .africa: return "Textbooks|Travel & Adventure|Africa"
                    case .americas(let subject): return subject.rawValue
                    case .asia: return "Textbooks|Travel & Adventure|Asia"
                    case .caribbean: return "Textbooks|Travel & Adventure|Caribbean"
                    case .essaysandMemoirs: return "Textbooks|Travel & Adventure|Essays & Memoirs"
                    case .adventureEurope: return "Textbooks|Travel & Adventure|Europe"
                    case .middleEast: return "Textbooks|Travel & Adventure|Middle East"
                    case .oceania: return "Textbooks|Travel & Adventure|Oceania"
                    case .specialtyTravel: return "Textbooks|Travel & Adventure|Specialty Travel"
                }
            }
            
            enum Americas: String {
                case canada = "Textbooks|Travel & Adventure|Americas|Canada"
                case latinAmerica = "Textbooks|Travel & Adventure|Americas|Latin America"
                case unitedStates = "Textbooks|Travel & Adventure|Americas|United States"
            }
        }
    }
}
