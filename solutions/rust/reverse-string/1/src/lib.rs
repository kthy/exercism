use unicode_reverse::reverse_grapheme_clusters_in_place;

pub fn reverse(input: &str) -> String {
    let mut mutable_input = input.to_string();
    reverse_grapheme_clusters_in_place(&mut mutable_input);
    mutable_input
    // non-unicode supporting solution was simply:
    // input.chars().rev().collect()
}
