import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxMacros

public struct ImplementProtocolMembersMacro: ExtensionMacro {
    public static func expansion(of node: SwiftSyntax.AttributeSyntax, attachedTo declaration: some SwiftSyntax.DeclGroupSyntax, providingExtensionsOf type: some SwiftSyntax.TypeSyntaxProtocol, conformingTo protocols: [SwiftSyntax.TypeSyntax], in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.ExtensionDeclSyntax] {
        [
            try ExtensionDeclSyntax("extension NonWorkingProtocol") {
                "var property: Int { 42 }"
            }
        ]
    }
}

@main
struct ProtocolMembersPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        ImplementProtocolMembersMacro.self
    ]
}
