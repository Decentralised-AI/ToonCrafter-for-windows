Set-Location $PSScriptRoot

$Env:PIP_DISABLE_PIP_VERSION_CHECK = 1
$Env:PIP_INDEX_URL = "https://mirror.baidu.com/pypi/simple"
$Env:HF_ENDPOINT = "https://hf-mirror.com"

if (!(Test-Path -Path "venv")) {
    Write-Output  "����python���⻷��venv..."
    python -m venv venv
}
.\venv\Scripts\activate

Write-Output "��װ����..."
pip install -U -r requirements-windows.txt

Write-Output "���ģ��..."

if (!(Test-Path -Path "checkpoints")) {
    mkdir "checkpoints"
}

Set-Location .\checkpoints

if (!(Test-Path -Path "tooncrafter_512_interp_v1")) {
    Write-Output  "����tooncrafter_512_interp_v1ģ��..."
    huggingface-cli download --resume-download Doubiiu/ToonCrafter --local-dir tooncrafter_512_interp_v1 --local-dir-use-symlinks False
}

Write-Output "��װ���"
Read-Host | Out-Null ;
