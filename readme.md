# Mastodon Media Maintenance Script
This Script removes cached and federated media.

# Requirements:
- Mastodon installed as documented here: https://docs.joinmastodon.org/admin/install/
- Logged in as Mastodon User
- The right home directory /home/mastodon/

# Instructions:
- Create a File: nano mastodon.sh
- Give the file the needed permissions: chmod 0755 mastodon.sh
- Run it: bash mastodon.sh
- Done.


# What does this script do?

- Deleting media (from federated servers) older than one day
- Deleting cached files
- Deleting files that do not belong to existing media attachments
