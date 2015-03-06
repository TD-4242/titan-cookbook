# Titan configuration sample: Cassandra & Elasticsearch over sockets

# The primary persistence provider used by Titan.  This is required.  It
# should be set one of Titan's built-in shorthand names for its standard
# storage backends (shorthands: berkeleyje, cassandrathrift, cassandra,
# astyanax, embeddedcassandra, hbase, inmemory) or to the full package and
# classname of a custom/third-party StoreManager implementation.
#
# Default:    (no default value)
# Data Type:  String
# Mutability: LOCAL
default['titan']['storage']['storage.backend'] = 'cassandra'

# The hostname or comma-separated list of hostnames of storage backend
# servers.  This is only applicable to some storage backends, such as
# cassandra and hbase.
#
# Default:    127.0.0.1
# Data Type:  class java.lang.String[]
# Mutability: LOCAL
default['titan']['storage']['storage.hostname'] = '127.0.0.1'

# Whether to enable Titan's database-level cache, which is shared across
# all transactions. Enabling this option speeds up traversals by holding
# hot graph elements in memory, but also increases the likelihood of
# reading stale data.  Disabling it forces each transaction to
# independently fetch graph elements from storage before reading/writing
# them.
#
# Default:    false
# Data Type:  Boolean
# Mutability: MASKABLE
default['titan']['storage']['cache.db-cache'] = false

# How long, in milliseconds, database-level cache will keep entries after
# flushing them.  This option is only useful on distributed storage
# backends that are capable of acknowledging writes without necessarily
# making them immediately visible.
#
# Default:    50
# Data Type:  Integer
# Mutability: GLOBAL_OFFLINE
#
# Settings with mutability GLOBAL_OFFLINE are centrally managed in Titan's
# storage backend.  After starting the database for the first time, this
# file's copy of this setting is ignored.  Use Titan's Management System
# to read or modify this value after bootstrapping.
default['titan']['storage']['cache.db-cache-clean-wait'] = 50

# Default expiration time, in milliseconds, for entries in the
# database-level cache. Entries are evicted when they reach this age even
# if the cache has room to spare. Set to 0 to disable expiration (cache
# entries live forever or until memory pressure triggers eviction when set
# to 0).
#
# Default:    10000
# Data Type:  Long
# Mutability: GLOBAL_OFFLINE
#
# Settings with mutability GLOBAL_OFFLINE are centrally managed in Titan's
# storage backend.  After starting the database for the first time, this
# file's copy of this setting is ignored.  Use Titan's Management System
# to read or modify this value after bootstrapping.
default['titan']['storage']['cache.db-cache-time'] = 10_000

# Size of Titan's database level cache.  Values between 0 and 1 are
# interpreted as a percentage of VM heap, while larger values are
# interpreted as an absolute size in bytes.
#
# Default:    0.3
# Data Type:  Double
# Mutability: MASKABLE
default['titan']['storage']['cache.db-cache-size'] = 0.3

# Connect to an already-running ES instance on localhost

# The indexing backend used to extend and optimize Titan's query
# functionality. This setting is optional.  Titan can use multiple
# heterogeneous index backends.  Hence, this option can appear more than
# once, so long as the user-defined name between "index" and "backend" is
# unique among appearances.Similar to the storage backend, this should be
# set to one of Titan's built-in shorthand names for its standard index
# backends (shorthands: lucene, elasticsearch, es, solr) or to the full
# package and classname of a custom/third-party IndexProvider
# implementation.
#
# Default:    elasticsearch
# Data Type:  String
# Mutability: GLOBAL_OFFLINE
#
# Settings with mutability GLOBAL_OFFLINE are centrally managed in Titan's
# storage backend.  After starting the database for the first time, this
# file's copy of this setting is ignored.  Use Titan's Management System
# to read or modify this value after bootstrapping.
default['titan']['storage']['index.search.backend'] = 'elasticsearch'

# The hostname or comma-separated list of hostnames of index backend
# servers.  This is only applicable to some index backends, such as
# elasticsearch and solr.
#
# Default:    127.0.0.1
# Data Type:  class java.lang.String[]
# Mutability: GLOBAL
#
# Settings with mutability GLOBAL are centrally managed in Titan's storage
# backend.  After starting the database for the first time, this file's
# copy of this setting is ignored.  Use Titan's Management System to read
# or modify this value after bootstrapping.
default['titan']['storage']['index.search.hostname'] = '127.0.0.1'

# The Elasticsearch node.client option is set to this boolean value, and
# the Elasticsearch node.data option is set to the negation of this value.
# True creates a thin client which holds no data.  False creates a regular
# Elasticsearch cluster node that may store data.
#
# Default:    true
# Data Type:  Boolean
# Mutability: GLOBAL_OFFLINE
#
# Settings with mutability GLOBAL_OFFLINE are centrally managed in Titan's
# storage backend.  After starting the database for the first time, this
# file's copy of this setting is ignored.  Use Titan's Management System
# to read or modify this value after bootstrapping.
default['titan']['storage']['index.search.elasticsearch.client_only'] = true

# Or start ES inside the Titan JVM
# default['titan']['storage']['index.search.backend'] = 'elasticsearch'
# default['titan']['storage']['index.search.directory'] = File.join(node['titan']['installation_dir'], 'db/es')
# default['titan']['storage']['index.search.elasticsearch.client-only'] = false
# default['titan']['storage']['index.search.elasticsearch.local-mode'] = true