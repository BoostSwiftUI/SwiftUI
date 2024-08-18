@attached(extension, conformances: Decodable)
@attached(member, names: named(CodingKeys))
public macro DTO() = #externalMacro(module: "DTOMacros", type: "DTOMacro")

@attached(accessor, names: named(willSet))
public macro Key(_: String? = nil) = #externalMacro(module: "DTOMacros", type: "KeyMacro")
