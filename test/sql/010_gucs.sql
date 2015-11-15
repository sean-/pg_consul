-- Make sure the module is loaded.
--
-- FIXME(seanc@): this is broken.  Why do I have to call the function to
-- initialize the shared object?  WHy isn't _PG_init() called upon new
-- connection from a client?  Something's broken here that I don't understand
-- yet and the oversight isn't jumping out at me.  Moving on, but marking
-- this as a bug.

-- Make sure extension parameters are present
SHOW consul.agent_hostname;

-- Set the agent hostname to something valid according to RFC791.
SET consul.agent_hostname = '127.0.0.2';
SHOW consul.agent_hostname;

-- Set the agent's hostname to something valid according to RFC1123.
SET consul.agent_hostname = 'localhost.localdomain';
SHOW consul.agent_hostname;

-- Test agent hostname error handling
SET consul.agent_hostname = '127.0.0..1';
SHOW consul.agent_hostname;

-- Return agent to localhost
SET consul.agent_hostname = '127.0.0.1';
SHOW consul.agent_hostname;