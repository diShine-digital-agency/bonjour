# How to publish a new version (no command line needed)

Bonjour builds and publishes itself automatically on GitHub. The **only** thing you have to do is
create a *release* on the GitHub website with a correctly-named tag. Everything else (building the
binaries for Mac/Linux/Windows and the Docker image) happens automatically in a few minutes.

> **The one rule that matters:** the version tag must look exactly like `v1.2.0` —
> the letter **v**, then three numbers separated by dots, and **nothing else**.
>
> ✅ Good: `v1.2.0`, `v1.10.3`, `v2.0.0`
> ❌ Bad: `v.1.0.2` (extra dot after the v), `1.2.0` (missing v), `v1.2` (only two numbers), `release-1.2.0`

If the tag is wrong, the automatic build now stops immediately and shows a red error telling you the
tag is invalid — just delete it and try again with the right name (steps below).

---

## Step-by-step: publish a version

1. Open the repository releases page in your browser:
   **https://github.com/diShine-digital-agency/bonjour/releases**

2. Click the **"Draft a new release"** button (top right).

3. Under **"Choose a tag"**, type the new version, e.g. `v1.2.0`, and click
   **"Create new tag: v1.2.0 on publish"** when it appears.
   - Make sure the tag is created **from the `main` branch** (the default target).

4. In **"Release title"**, type the same version, e.g. `v1.2.0`.

5. Click **"Generate release notes"** to fill in the description automatically
   (you can edit it afterwards if you like).

6. Click the green **"Publish release"** button.

7. Wait about 5–10 minutes. Then check that everything built:
   - Open **https://github.com/diShine-digital-agency/bonjour/actions** —
     the **"Create release"** run should show a green ✅.
   - Back on the Releases page, your release should now list downloadable files such as
     `bonjour_1.2.0_linux_amd64.tar.gz`, `bonjour_1.2.0_darwin_arm64.tar.gz`, and
     `bonjour_1.2.0_windows_amd64.zip`.

That's it — the new version is online.

---

## If something goes wrong: deleting a bad release or tag

If you published with a wrong tag name (for example `v.1.0.2`), remove it like this:

1. On the **Releases** page, click the bad release, then click **"Delete"** (top right of the release).
2. Then delete the tag itself: open
   **https://github.com/diShine-digital-agency/bonjour/tags**, find the bad tag,
   click the **⋯** menu on the right, and choose **"Delete tag"**.
3. Go back to the step-by-step above and publish again with the correct tag.

Deleting a release or tag does **not** delete any code — it only removes that specific published
package, so it is safe.

---

## What happens automatically after you publish

The file `.github/workflows/release.yaml` runs a tool called GoReleaser which:

- checks the tag name is valid (stops with a clear error if not),
- builds the `bonjour` binary for macOS (Intel & Apple Silicon), Linux (x86 & ARM), and Windows,
- attaches those files to the GitHub release,
- builds and pushes the Docker images to
  `ghcr.io/dishine-digital-agency/bonjour` with tags `:<version>` and `:latest`.

The version you type in the tag is also embedded into the binary, so running
`bonjour --version` on a downloaded release prints that same version.
