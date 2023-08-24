use std::collections::HashMap;
use std::cmp::Ord;
trait SortByKey<K, V> {
    fn sort_by_key(&mut self);
}
impl<K, V> SortByKey<K, V> for HashMap<K, V>
where
    K: Ord + Clone,
    V: Clone,
{
    fn sort_by_key(&mut self) {
        let mut sorted_pairs: Vec<(K, V)> = self
            .iter()
            .map(|(k, v)| (k.clone(), v.clone()))
            .collect();  
        sorted_pairs.sort_by(|(k1, _), (k2, _)| k1.cmp(k2));
        self.clear();
        self.extend(sorted_pairs.into_iter());
    }
}
fn main() {
    let mut my_map: HashMap<i32, String> = HashMap::new();
    my_map.insert(3, String::from("three"));
    my_map.insert(1, String::from("one"));
    my_map.insert(2, String::from("two"));
    println!("Original map: {:?}", my_map);
    my_map.sort_by_key();
    println!("Sorted map: {:?}", my_map);
}

