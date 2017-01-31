GoldCoin (GLD) - an improved version of Litecoin using scrypt as a proof of work scheme.
 - 2.5 minute block targets up till block 45000
 - 2 minute block targets there after
 - 504 blocks per difficulty retarget up to block 45000
 - 60 blocks per difficulty retarget up to block 251230
 - 1 block per difficulty retarget thereafter
 - 51% difficulty adjusting defence system. Blocks multi-tiered double spending attempts(first of its kind).
 - Golden River difficulty algorithmn - Better than gravity wave. 
 - Pure POW.

Block rewards in order:

 - 200 Block @ 10000 GLD
 - 2000	Blocks @ 1000 GLD
 - 42800 Blocks @ 500 GLD
 - (The values below are post-fork in development/dispute values)
 - The Block reward drops to 45 GLD
 - Reward for the years thereafter is 50 divided by (1.1 + 0.49*every year after fork)
 - There is a 20 year jump that occurs at block 372,000
 - Total Reward Blocks: 21,441,000
 - Total Coins Produced: 72,245,700 (including 50 coin 0th block)
 - The default ports are 8121 (connect) and 8122 (fson rpc)
 
 Note in order to properly mine GLD, an accurate system time is necessary. 
 GLD will not accept blocks that are more than 45 seconds into the future and more than 2 minutes into the past.
 
 This makes this coin ideal for time stamping purposes as well.

Development process
===================

Developers work in their own trees, then submit pull requests when
they think their feature or bug fix is ready.

The patch will be accepted if there is broad consensus that it is a
good thing.  Developers should expect to rework and resubmit patches
if they don't match the project's coding conventions (see coding.txt)
or are controversial.

The master branch is regularly built and tested, but is not guaranteed
to be completely stable. Tags are regularly created to indicate new
official, stable release versions of Goldcoin.

Feature branches are created when there are major new features being
worked on by several people.

From time to time a pull request will become outdated. If this occurs, and
the pull is no longer automatically mergeable; a comment on the pull will
be used to issue a warning of closure. The pull will be closed 15 days
after the warning if action is not taken by the author. Pull requests closed
in this manner will have their corresponding issue labeled 'stagnant'.

Issues with no commits will be given a similar warning, and closed after
15 days from their last activity. Issues closed in this manner will be 
labeled 'stale'. 

Check out http://gldcoin.com for more info about the development.

Development Team
================
- akumaburn
- Stouse49

Consultants
================
- Sting17
- Microguy
- CryptoSolar
- Psionin
- CryptoCanary
