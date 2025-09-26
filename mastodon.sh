#!/bin/bash

#written by MillennialChap 2024 - https://millennialchap.com
#Script under the GNU AGPLv3 license.

#using the correct directory
echo "Navigating to the Mastodon Directory now";
cd /home/mastodon/live/;

#deleting cache files
echo "Clearing cache";
RAILS_ENV=production /home/mastodon/live/bin/tootctl cache clear;

# Prune remote accounts that never interacted with a local user
echo "Prune local accounts";
RAILS_ENV=production /home/mastodon/live/bin/tootctl accounts prune;

# Remove remote statuses that local users never interacted with older than 1 day
echo "Remove remote statuses older than 1 day";
RAILS_ENV=production /home/mastodon/live/bin/tootctl statuses remove --days=1;

# Remove media attachments older than 1 day
echo "Remove media attachments older than 1 day";
RAILS_ENV=production /home/mastodon/live/bin/tootctl media remove --days=1;

# Remove all headers
echo "Remove all headers";
RAILS_ENV=production /home/mastodon/live/bin/tootctl media remove --remove-headers --include-follows --days=0;

# Remove link previews older than 1 day
echo "Remove link previews older than 1 day";
RAILS_ENV=production /home/mastodon/live/bin/tootctl preview_cards remove --days=1;

# Remove files not linked to any post
echo "Remove files not linked to any post";
RAILS_ENV=production /home/mastodon/live/bin/tootctl media remove-orphans;

#finishing script
echo "Done.";

exit 0;
