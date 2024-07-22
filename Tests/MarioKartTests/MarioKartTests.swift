import XCTest
@testable import MarioKart



// 0. Let's write your first swift test
// Your first usage of swift testing
import Testing

@Suite
struct MyFirstSuite {
    @Test
    func foo() {
        #expect(1 == 1)
    }
}

struct MyFirstSuite2 {
    @Test
    func foo() {
        #expect(1 == 1)
    }
}

@Test
func foo() {
    #expect(1 == 1)
}

// 1. Test Mario and Luigi Signature Phrase
// Organize tests with Suite
@Suite("Mario related tests")
struct MarioTests {
    @Test("Verify Mario signature phrase")
    func marioSignaturePhrase() {
        #expect(MarioCharacter().say() == "It's-a-me, Mario")
    }
    
    @Test("Verify Luigi signature phrase")
    func LuigiSignaturePhrase() {
        #expect(LuigiCharacter().say() == "Mama mia!")
    }
}

@Suite("Characters")
struct MarioTests2 {
    @Suite("Signature phrases")
    struct MarioTests {
        @Test("Mario", .tags(.marioRelated))
        func marioSignaturePhrase() {
            #expect(MarioCharacter().say() == "It's-a-me, Mario")
        }
        
        @Test("Luigi")
        func LuigiSignaturePhrase() {
            #expect(LuigiCharacter().say() == "Mama mia!")
        }
    }
}

// 2. Test Mario, Luigi Base traits stats
// Organize tests with Suite

@Suite("Verify Character base traits")
final class BaseTraits {
    @Test("Mario", .tags(.marioRelated))
    func mario() {
        let sut = MarioCharacter()
        #expect(sut.speedTraitValue.value == 0.7)
        #expect(sut.AcceleratorTraitValue.value == 0.6)
        #expect(sut.WeightTraitValue.value == 0.4)
        #expect(sut.GripTraitValue.value == 0.6)
    }
    
    @Test("Luigi")
    func luigi() {
        let sut = LuigiCharacter()
        #expect(sut.speedTraitValue.value == 0.8)
        #expect(sut.AcceleratorTraitValue.value == 0.5)
        #expect(sut.WeightTraitValue.value == 0.3)
        #expect(sut.GripTraitValue.value == 0.7)
    }
}

// 3.  What if I want to test everythign about mario?
// Introducing tags. A way to mark tests and categorize them.
private extension Tag {
  @Tag static var marioRelated: Self
}

// 4. 🐛 A bug reported in production that speed is more than 100% and app crashes. Write a test that captures that.
// Introducing Bug trait.
class HackerSpeedCharacter: AnyCharacter {
    var speedTraitValue: MarioKart.SpeedTrait = .init(value: 3.0) // 300%
    var AcceleratorTraitValue: MarioKart.AcceleratorTrait = .init(value: 0.0)
    var WeightTraitValue: MarioKart.WeightTrait = .init(value: 0.0)
    var GripTraitValue: MarioKart.GripTrait = .init(value: 0.0)
}

@Test("Speed trait must be capped at 100%", .bug("https://atlassian.net/jira/software/MAPP-123", "Fix capped speed"))
func cappedSpeed() {
    let builder = BuilderManager()
    builder.selectCharacter(HackerSpeedCharacter())
    builder.selectWheel(RollerWheels())
    builder.selectParachute(HylianKiteParachute())
    
    let player = try? builder.ready()
    
    #expect(player?.speedTraitValue.value == 3.1399999999999997)
}


// 5. Signature Phrases tests look the same.
// Introducing Parametrized Tests
@Test(
    "Test Signature Phrases",
    arguments: [
        (MarioCharacter() as HavingSignaturePhrase, "It's-a-me, Mario"),
        (LuigiCharacter() as HavingSignaturePhrase, "Mama mia!"),
        (PeachCharacter() as HavingSignaturePhrase, "Take that!")
    ]
)
func signaturePhrases(input: (HavingSignaturePhrase, String)) {
    #expect(input.0.say() == input.1)
}


// 5.1. Check builder combinations. More code coverage with less code.
// Introducing Parametrized Tests
@Test(
    "Test All different combinations for builder with Hylian Parachute",
    arguments:
        [
            MarioCharacter() as AnyCharacter,
            LuigiCharacter() as AnyCharacter,
            PeachCharacter() as AnyCharacter
        ],
        [
            RollerWheels() as AnyWheel,
            MonsterWheels() as AnyWheel,
            AzureRollerWheels() as AnyWheel
        ]
)
func signaturePhrases(character: AnyCharacter, wheel: AnyWheel) {
    let builder = BuilderManager()
    builder.selectCharacter(character)
    builder.selectWheel(wheel)
    builder.selectParachute(HylianKiteParachute())

    #expect(throws: Never.self) {
        try builder.ready()
    }
}

// 8. UserRepository exposes if the user is pro or not. Let's see how to test async functions.
class UserProDataFetcherMock: UserProDataFetcher {
    var fetchStub: UserProData! = nil
    func fetch(for user: User) async throws -> UserProData {
        fetchStub
    }
}

@Test("Validate UserRepositoryisUserPro()")
func proUser() async {
    let mock = UserProDataFetcherMock()
    mock.fetchStub = .init(email: "", lastTimePayedForPro: .distantPast, isProUser: true)
    let sut = UserRepository(userProDataFetcher: mock)
    
    await #expect(throws: Never.self) {
        let result = try await sut.isUserPro(
            user: .init(
                email: "luigi@betssongroup.com",
                token: "foo"
            )
        )
        #expect(result == true)
    }
}


// Bonus points 🎉

// Control + option + command + G (rerun the tests you run last time)
