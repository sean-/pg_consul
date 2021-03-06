/* pg_consul/pg_consul--0.1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION pg_consul" to load this file. \quit

-- Register functions.
CREATE FUNCTION consul_agent_ping()
RETURNS BOOL
AS 'MODULE_PATHNAME', 'pg_consul_v1_agent_ping0'
LANGUAGE C;

CREATE FUNCTION consul_agent_ping(
       IN host TEXT,
       IN port INT4 DEFAULT 8500::INT4)
RETURNS BOOL
AS 'MODULE_PATHNAME', 'pg_consul_v1_agent_ping2'
LANGUAGE C;

CREATE FUNCTION consul_status_leader()
RETURNS TEXT
AS 'MODULE_PATHNAME', 'pg_consul_v1_status_leader'
LANGUAGE C
LEAKPROOF;

CREATE FUNCTION consul_status_peers(
       OUT host TEXT,
       OUT port INT4,
       OUT leader BOOL)
RETURNS SETOF RECORD
AS 'MODULE_PATHNAME', 'pg_consul_v1_status_peers'
LANGUAGE C
LEAKPROOF
ROWS 5;

CREATE FUNCTION consul_kv_get(
       IN "key" TEXT,
       IN recurse BOOL DEFAULT FALSE,
       IN cluster TEXT DEFAULT NULL,
       OUT "key" TEXT,
       OUT "value" TEXT,
       OUT flags INT8,
       OUT create_index INT8,
       OUT modify_index INT8,
       OUT lock_index INT8,
       OUT "session" TEXT)
RETURNS RECORD
AS 'MODULE_PATHNAME', 'pg_consul_v1_kv_get'
LANGUAGE C
LEAKPROOF;

