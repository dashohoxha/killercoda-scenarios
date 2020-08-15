# Multiple sites vs. multiple containers

As we have seen, we can install multiple sites in a single Wordpress
container, but we can also install a single site for each Wordpress
container. Which one is better?

It depends.

When we consolidate multiple sites in a single Wordpress container we
use less resources (RAM and disk space) then installing each site on
its own container.

However if one of these sites is compromised (for example you install
a plugin with a security hole) it can potentially compromise the other
sites that are on the same container.

If each site is on its own container, they are better encapsulated
from each-other.
