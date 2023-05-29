public class Frontier {
  private PriorityQueue<Location>heap;
  
  public Frontier() {
   heap = new PriorityQueue<Location>();
  }

  public void add(Location place) {
     heap.add(place);
  }
  
  public Location remove() {
    return heap.remove();
  }
  
  public int size() {
   return heap.size();
  }

  public void clear() {
   heap.clear();
  }

}
