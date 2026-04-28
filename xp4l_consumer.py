from pathlib import Path
import json

LOG_PATH = Path("E:/XP4Life/logs/events.log")
TOTAL_PATH = Path("E:/XP4Life/logs/total_xp.txt")

def ensure_log():
    LOG_PATH.parent.mkdir(parents=True, exist_ok=True)
    if not LOG_PATH.exists():
        LOG_PATH.write_text("", encoding="utf-8")


def validate_event(event: dict):
    if not isinstance(event, dict):
        return False
    if not event.get("id"):
        return False
    if not event.get("ts"):
        return False
    if not event.get("data", {}).get("label"):
        return False
    return True


def event_exists(event_id: str):
    ensure_log()

    with LOG_PATH.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue

            try:
                record = json.loads(line)
            except json.JSONDecodeError:
                continue

            if record.get("id") == event_id:
                return True

    return False


def calculate_xp(event: dict):
    value = event.get("data", {}).get("value", 1)

    try:
        value = int(value)
    except (TypeError, ValueError):
        value = 1

    return 10 * value

def update_total(xp: int):
    total = 0

    if TOTAL_PATH.exists():
        try:
            total = int(TOTAL_PATH.read_text(encoding="utf-8").strip())
        except ValueError:
            total = 0

    total += xp
    TOTAL_PATH.write_text(str(total), encoding="utf-8")
    return total

def process_event(event: dict):
    ensure_log()

    if not validate_event(event):
        return "FAIL"

    event_id = event.get("id")

    if event_exists(event_id):
        return "SKIP"

    xp = calculate_xp(event)

    record = {
        "id": event_id,
        "ts": event.get("ts"),
        "source": event.get("source"),
        "type": event.get("type"),
        "label": event.get("data", {}).get("label"),
        "xp": xp,
    }

    with LOG_PATH.open("a", encoding="utf-8") as f:
        f.write(json.dumps(record, ensure_ascii=False) + "\n")

    update_total(xp)

    return "SUCCESS"