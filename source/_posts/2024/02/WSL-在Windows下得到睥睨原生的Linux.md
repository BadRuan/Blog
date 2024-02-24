---
title: WSL:在Windows下得到睥睨原生的Linux
date: 2024-02-18 21:50:28
tags:
- windows
- linux
categories: linux
---

## 什么是 WSL？
全称``Windows Subsystem for Linux``,是一个在 Windows 10 上能够运行原生 Linux 二进制可执行文件 (ELF 格式) 的兼容层。

### 区别于虚拟机
使用 VM 虚拟机时通常性能较低，因为需要大量的资源来运行虚拟实例，并且两个操作系统之间缺乏集成，其实仍在运行孤立的单独操作系统。

WSL 解决了这些问题，它集成了 Windows 和 Linux，使用的资源占用量要少得多，与传统的虚拟机相比，所需的资源（CPU、内存、存储）更少。 以令人难以置信的快速高效的性能，在 Linux 开发环境旁边运行 Windows Office 应用、开发工具、游戏等。

## 原理
WSL 最初于 2016 年 8 月推出（Windows 10 版本 1607），使用的是现在称为 “WSL 1” 的体系结构。 WSL 1 作为一个转换层运行，在 Windows 内核上使用一个 Linux 内核接口。 可将 WSL 1 视为一个兼容层，用于模拟在 Windows 环境中运行 Linux 二进制文件的系统调用。

2019 年 5 月，Microsoft 发布了 WSL 2，引入了对 WSL 体系结构的重要更改，包括在一部分 Hyper-V 功能中使用真正的 Linux 内核。 WSL 2 体系结构显著提高了性能，增加了系统调用速度，并减少了限制。 WSL 2 现在是在 Windows 上安装 Linux 分发版时使用的默认体系结构。

## 安装 WSL
通过在管理员 PowerShell 或 Windows 命令提示符中输入 ``wsl --install``，然后重启计算机，可以安装运行 WSL 所需的全部内容。

> 必须确保运行的是 Windows 11 或 Windows 10 版本 2004+（内部版本 19041 及更高版本），才能运行 WSL install 命令。

### wsl --install 命令执行以下操作

1. 启用虚拟机平台可选组件并安装 WSL 核心二进制文件。
2. 从Microsoft Store 下载 WSL 包（包括最新的 Linux 内核），以便在更新和安全修补程序可用时推送它们。
3. 下载并安装 Linux。

### 安装其他 Linux 发行版
认情况下，wsl --install 命令将安装 Linux 的 Ubuntu 发行版。 可以从 Microsoft Store 中提供的列表中选择其他 Linux 发行版。 还可以与默认的 Ubuntu 一起安装其他 Linux 发行版。

若要查看当前通过应用商店提供了哪些发行版，请输入命令：``wsl --list --online``

![](/images/2024-02-18/wsl-list.png)

若要选择用其他版本替换默认的 Ubuntu 发行版，或者要从应用商店安装其他发行版，使用命令：``wsl --install --distribution <Distribution Name>``

## 基本 WSL 命令

1. ``wsl --version`` 检查已安装的 WSL 版本。
2. ``wsl --update`` 命令确保拥有最新的 WSL 更新。
3. ``wsl --list --verbose`` 列出当前已安装的 Linux 发行版。
4. ``wsl ~`` 命令，打开 Bash 命令行（从设为默认版本的 Linux 发行版），转到 WSL 文件系统的主目录。提示符会变成 Bash，看起来像这样：``<user>@<CPU-name>:~$``。 输入 pwd 命令以确认目录路径现在类似于 ``/home/<username>``。 输入 ``explorer.exe .`` 命令，在 Windows 文件资源管理器中打开该目录（一定要包含句点，它表示打开当前目录路径）。 打开后，可以确认文件路径看起来像这样：``\\wsl.localhost\Ubuntu\home\<username>``。

![](/images/2024-02-18/wsl-home-command.png)

5. ``exit`` 从 Bash 命令行退出，返回到 PowerShell。

## 使用 WSL 扩展的 Visual Studio Code

VS Code 使用 WSL 扩展，此扩展使 VS Code 的用户界面能够在 Windows 上运行，命令、扩展、调试、代码自动完成、Lint 分析等都在 WSL Linux 安装上运行。 

![](/images/2024-02-18/Snipaste_2024-02-18_22-06-50.png)