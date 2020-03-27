export function promiseQuery(con, query){
    return new Promise((resolve, reject) => {
        return con.query(query, (err, result, fields) => err ? reject(err) : resolve({result, fields}));
    })
}