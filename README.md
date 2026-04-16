# TheForge

An automated setup for different Gentoo devices with profile selection included.

image here

# Overview

This repo contains an automated script for installing and configuring packages onto a Gentoo machine with the ability to differentiate between devices and device profiles. 

Each package is meant to be a self contained script, accounting for its own dependencies, allowing them to be added or removed to any profile.

>[!IMPORTANT]]
> 
> Package install scripts are **opinionated**. Meaning their USE flags, installation methods, etc. will need to be altered if necessary. Read more here(link)

## Directory Structure

The core directories are:

* base
  Contains the necessary dependencies to run the script; needed for every profile
* devices
  The devices supported by the script, with each one containing the sub directories of supported profiles
* lib
  Holds the helper functions used throughout the script
* modules
  Contains all of the package install scripts, separated by category
  
>[!TIP]]
>
>Each sub directory will contain its own README for further documentation

# Usage
