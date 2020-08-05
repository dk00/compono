const getDB = async () => {
  const {openDB} = await import('idb/with-async-ittr.js')
  return openDB('invoices', 1, {
    upgrade(db) {
      // Create a store of objects
      const store = db.createObjectStore('invoices', {
        // The 'id' property of the object will be the key.
        keyPath: 'serial'
      })
      // Create an index on the 'date' property of the objects.
      store.createIndex('date', 'date')
    },
  })
}

const saveInvoice = async data => {
  const db = await getDB()
  await db.put('invoices', data)
  return db.close()
}

export {saveInvoice}