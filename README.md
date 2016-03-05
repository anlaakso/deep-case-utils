# Deep case utils

Set of case utils for JavaScript objects

Usage:

```js
	var deepCaseUtis = require('deep-case-utils');

	var object = [{ foo_bar: [{bar_baz: 123}, 345 ] }, 'foo'];

	var camelCasedObject = deepCaseUtis.camelCase(object);
	//[{ fooBar: [{barBaz: 123}, 345 ] }, 'foo']

```
