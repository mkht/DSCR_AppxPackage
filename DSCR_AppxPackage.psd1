#
# モジュール 'DSCR_AppxPackage' のモジュール マニフェスト
#
# 生成者: mkht
#
# 生成日: 2017/10/07
#

@{

# このマニフェストに関連付けられているスクリプト モジュール ファイルまたはバイナリ モジュール ファイル。
# RootModule = ''

# このモジュールのバージョン番号です。
ModuleVersion = '0.2.1'

# このモジュールを一意に識別するために使用される ID
GUID = 'f1c6e39c-bc04-4fbe-b74a-2154d578295b'

# このモジュールの作成者
Author = 'mkht'

# このモジュールの会社またはベンダー
CompanyName = ''

# このモジュールの著作権情報
Copyright = '(c) 2017 mkht All rights reserved.'

# このモジュールの機能の説明
# Description = ''

# このモジュールに必要な Windows PowerShell エンジンの最小バージョン
PowerShellVersion = '5.0'

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# RootModule/ModuleToProcess に指定されているモジュールの入れ子になったモジュールとしてインポートするモジュール
# NestedModules = @()

# このモジュールからエクスポートする関数です。最適なパフォーマンスを得るには、ワイルドカードを使用せず、エクスポートする関数がない場合は、エントリを削除しないで空の配列を使用してください。
FunctionsToExport = @()

# このモジュールからエクスポートするコマンドレットです。最適なパフォーマンスを得るには、ワイルドカードを使用せず、エクスポートするコマンドレットがない場合は、エントリを削除しないで空の配列を使用してください。
CmdletsToExport = @()

# このモジュールからエクスポートする変数
VariablesToExport = '*'

# このモジュールからエクスポートするエイリアスです。最適なパフォーマンスを得るには、ワイルドカードを使用せず、エクスポートするエイリアスがない場合は、エントリを削除しないで空の配列を使用してください。
AliasesToExport = @()

# このモジュールからエクスポートする DSC リソース
DscResourcesToExport = @('cAppxPackage', 'cAppxProvisionedPackage')

# このモジュールからエクスポートされたコマンドの既定のプレフィックス。既定のプレフィックスをオーバーライドする場合は、Import-Module -Prefix を使用します。
# DefaultCommandPrefix = ''

}

