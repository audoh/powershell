@{
  IncludeRules = @(
    'PSPlaceOpenBrace',
    'PSPlaceCloseBrace',
    'PSUseConsistentWhitespace',
    'PSUseConsistentIndentation',
    'PSAlignAssignmentStatement',
    'PSUseCorrectCasing',
    'PSAvoidUsingDoubleQuotesForConstantStrings',
    'PSAvoidTrailingWhitespace',
    'PSAvoidLongLines',
    'PSAvoidAlias',
    'PSAvoidEmptyCatchBlock',
    'PSAvoidGlobalAliases',
    'PSAvoidGlobalFunctions',
    'PSAvoidGlobalVars',
    'PSAvoidDefaultTrueValueSwitchParameter',
    'PSAvoidDefaultValueForMandatoryParameter',
    'PSAvoidAssignmentToAutomaticVariable',
    'PSAvoidReservedParams',
    'PSAvoidReservedCharInCmdlet',
    'PSAvoidOverwritingBuiltInCmdlets',
    'PSAvoidUsingPlainTextForPassword'
    'PSAvoidUsingConvertToSecureStringWithPlainText',
    'PSAvoidUserNameAndPasswordParams',
    'PSAvoidUsingComputerNameHardcoded',
    'PSAvoidNullOrEmptyHelpMessageAttribute',
    'PSUseApprovedVerbs'
  )

  Rules = @{
    PSUseCorrectCasing = @{ Enable = $True }
    PSAvoidUsingDoubleQuotesForConstantStrings = @{ Enable = $True }
    PSAvoidTrailingWhitespace = @{ Enable = $True }
    PSAvoidAlias = @{ Enable = $True }
    PSAvoidEmptyCatchBlock = @{ Enable = $True }
    PSAvoidGlobalAliases = @{ Enable = $True }
    PSAvoidGlobalFunctions = @{ Enable = $True }
    PSAvoidGlobalVars = @{ Enable = $True }
    PSAvoidDefaultTrueValueSwitchParameter = @{ Enable = $True }
    PSAvoidDefaultValueForMandatoryParameter = @{ Enable = $True }
    PSAvoidAssignmentToAutomaticVariable = @{ Enable = $True }
    PSAvoidReservedParams = @{ Enable = $True }
    PSAvoidReservedCharInCmdlet = @{ Enable = $True }
    PSAvoidOverwritingBuiltInCmdlets = @{ Enable = $True }
    PSAvoidUsingPlainTextForPassword = @{ Enable = $True }
    PSAvoidUsingConvertToSecureStringWithPlainText = @{ Enable = $True }
    PSAvoidUserNameAndPasswordParams = @{ Enable = $True }
    PSAvoidUsingComputerNameHardcoded = @{ Enable = $True }
    PSAvoidNullOrEmptyHelpMessageAttribute = @{ Enable = $True }
    PSUseApprovedVerbs = @{ Enable = $True }

    PSPlaceOpenBrace = @{
      Enable = $True
      OnSameLine = $True
      NewLineAfter = $True
      IgnoreOneLineBlock = $True
    }

    PSPlaceCloseBrace = @{
      Enable = $True
      NewLineAfter = $True
      IgnoreOneLineBlock = $True
      NoEmptyLineBefore = $False
    }

    PSUseConsistentIndentation = @{
      Enable = $True
      Kind = 'space'
      PipelineIndentation = 'IncreaseIndentationForFirstPipeline'
      IndentationSize = 2
    }

    PSUseConsistentWhitespace = @{
      Enable = $True
      CheckInnerBrace = $True
      CheckOpenBrace = $True
      CheckOpenParen = $True
      CheckOperator = $True
      CheckPipe = $True
      CheckPipeForRedundantWhitespace = $False
      CheckSeparator = $True
      CheckParameter = $True
      IgnoreAssignmentOperatorInsideHashTable = $False
    }

    PSAvoidLongLines = @{
      Enable = $True
      MaximumLineLength = 120
    }
  }
}
