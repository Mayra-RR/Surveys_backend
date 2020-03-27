export function classifyHelper(data: any[]) {

    const defaultValue = { insert: [], update: [] }
    return data.reduce((acc, current) => {
        if (current.answer_id) {
            acc.update.push(current)
        } else {
            acc.insert.push(current)
        }
        return acc;
    }, defaultValue
    );
} 