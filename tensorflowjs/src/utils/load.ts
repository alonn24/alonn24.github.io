export default async function load(url) {
  const res = await fetch(url);
  return res.json();
}
