Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3596D277007
	for <brcm80211@lists.linux.dev>; Wed, 15 Jul 2026 06:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784098186; cv=none; b=olFAtoC4cRmYyb9TCJ2dhPD2IA4m6kRnSkMasoSkSe4pFwxP+jX+87NsJePb+iP1GCyCbDd6bFzb4b04Tf9l8ps1Ultux+0/0XhVpSwHg0Ymw2crzSK+L6Zn93MBSM4IK55fYxF/7pW0K98kAcmTSjB3tqhg6eVQEy+0DHxmhUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784098186; c=relaxed/simple;
	bh=H3H+U00EvKmnxYu0Zr7XD5SgUBsLDMZC5MZOue8X6sk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Kkq1NJeVncyFx4nY7oWq4hBiAKlZ0lC4ZXJLOW5JuzT5J4pznd4a9YqdHw3xTKyI6UtV1+Su51/t+Q10GgeZ8pWozmAMGLRARQ9PHktZ6o2zLys6PrRN0qxwm5cS1S31aOhwJFGtZ5/nPoq9kZ0WJnS5FHgH2FkLTboyNxH7XvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbYzDhaf; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbYzDhaf"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ccf2360620so15388215ad.3
        for <brcm80211@lists.linux.dev>; Tue, 14 Jul 2026 23:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784098183; x=1784702983; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WAxwSysnuvqpld0W2wLJvg0Kqlo0lOvRkB5I8+laT8o=;
        b=RbYzDhaflYKgITINL/K4P2XvxCzThFBcgMjQkIFrireMvqY2MEfqpY3aqI+QskU8lN
         f5cUVWLos9X2uDC4gilz8t7uNRgLLnPRzEWnwuXJUfGDxy32YPaHx+yro4TuRXt5d9Cy
         f5QfpLwPLXqzXBSO/qh14M2Hr5G1YgrWo7/xXxyoDrwZthO1GXZ197A6FC+ZEzSfGcB+
         NyEttvA6hn4anSddMKPdAGZ5RuD1ECFkMhUFLA4fXqUAqaJDI1mZfu7ROykOBRyNXrGt
         eHKRUuZjFy5eiVd0wQa1rYIb3NE/9o1SZo/VAoCXQYO9NXEzPnd7xP9Dwazn5mwSRLTj
         tZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784098183; x=1784702983;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WAxwSysnuvqpld0W2wLJvg0Kqlo0lOvRkB5I8+laT8o=;
        b=Pc2+5BS8ZdDId4C+AAeeDDinTZCVAEYmQWKMT+q/O3U+bg8xKbqCHRSOsMxFPZuVIc
         HEGiXe35FrU7X7j7aDUhlJxhr7k8Jug1F9nfEy6/3+Rhq2UU1vrwQK0iFwEG8sXO2HrG
         dYi3s+/e1NIi0d2jS7AtACW7QHVFGeYTCXBH3IqBP0GX7GEh5F8mqpLNJpCS8E2mdXyN
         ivGq57EMPFjgOTBSKo6MhfUNjmNHVQ2Vh6zuFMlxbzOQUmJKt4eCThN7Iu2nN9wp/0Y6
         5/rKTsfCMatcUe2nM5TCe5eBjzLfqVFeMM1Xn2IqvrZohxyhOiTeNtWK5XWpkDUDo/15
         G/Mw==
X-Forwarded-Encrypted: i=1; AHgh+RrLKAiS03XH7SjPYjfXbejywP0yFVwMYXuSteL0+6m8yrUcaN85gwmb/pF66MuihSgBeFDIYLLLzn0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh4Fi5xn+fc7Em7DClRd0NPu88IkY6PxYSLilDs2VgWMb+IHFX
	ORsz+MHbL4q5AFMPxcPlMpNh66URqnXifF8SRWSzcK90imX+PRg5cvJF
X-Gm-Gg: AfdE7ckYd1RpUts2RsJGwRqgVFwDxTmoc9AnhKqQ8yhuogd6pMvG245Gj7/nVCVsnod
	/JiA1HTvt6FKzRqYeHL6Axo5S7qBB/BbJI1fVelFc89d5w7Y4KPoWDtESyG7dffEP8qhON5ATQu
	QiC2bU7tQvIORYhutELldV55+qpa9SxXTYuP1CS77cxfOT90YYy6nytNRG0ZGJWzPboUeIZSXfS
	+pn4D0bZafK0YdBF8IaO2/4iIRtPvKG2HE1RS5sQryDb/JZsl8BsRWQQYs4gdMLqLskKIP2B2Vj
	y8gTd9lguwf+fgvS2S4RiO7yk1HkfqNnpmJWeBmBUu0unrLo+zEDtsP8ZiVVZ/xAj5oG5Tn/iuj
	KBMarP53Y/HYJOViPL9K0N3k9HUQCWkFPQulpFqmghYsxT+1UuYytBmv1Xy2uSICMYDVrsmiYkZ
	ykWHsZwdje3yKNVIYfvPEjnWKQIh9VRP71kKm+b2zyGZFG6tS3XQy91zw/hCR+O0wZcO3b7k3N
X-Received: by 2002:a17:902:f683:b0:2c9:97a7:f543 with SMTP id d9443c01a7336-2ce9f1789d4mr143177005ad.41.1784098183463;
        Tue, 14 Jul 2026 23:49:43 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ce7b3755a3sm86051435ad.80.2026.07.14.23.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:49:42 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Wed, 15 Jul 2026 14:49:38 +0800
Subject: [PATCH v2] wifi: brcmfmac: set F2 blocksize to 256 for BCM43752
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-b43752-f2-blksz-v2-1-f9be49856050@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIEtV2oC/3WNyw6CMBBFf4XM2jG0RSqu/A/DorRTmMjDtKZRC
 f9uZe/ynOSeu0KkwBThUqwQKHHkZc4gDwXYwcw9IbvMIEtZl1oo7CqlTxK9xG68xw+Sd0Y4UuS
 ogbx6BPL82ou3NvPA8bmE936QxM/+byWBAs91o731ZMhX134yPB7tMkG7bdsX39Irr64AAAA=
X-Change-ID: 20260713-b43752-f2-blksz-efda1de3ede9
To: Arend van Spriel <arend.vanspriel@broadcom.com>, 
 Kalle Valo <kvalo@kernel.org>, Angus Ainslie <angus@akkea.ca>
Cc: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>, 
 Wig Cheng <onlywig@gmail.com>, linux-wireless@vger.kernel.org, 
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784098180; l=4721;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=H3H+U00EvKmnxYu0Zr7XD5SgUBsLDMZC5MZOue8X6sk=;
 b=VN931l1m4was2Q22iLRg/8Eb8uMCk/v1EXvXXIMHef101oh3mdsnCMBnu+QE4nXo6hy4jb++h
 aGpKCwThUUABqbOjnBsZzD7lMaydacgFqTa/kt776aaUl0CemMC7Tj7
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=

The BCM43752 is not reliable with the default 512-byte SDIO function 2
block size: on an i.MX8MP board with an AMPAK AP6275S module at
SDR104 / 200 MHz, an iperf TX stress test kills WLAN within seconds:

  mmc_submit_one: CMD53 sg block write failed -84
  brcmf_sdio_dpc: failed backplane access over SDIO, halting operation

Commit d2587c57ffd8 ("brcmfmac: add 43752 SDIO ids and initialization")
set up the 43752 like the 4373 for the F2 watermark but missed the F2
block size, which the 4373 limits to 256 bytes. The vendor driver
(bcmdhd) also programs a 256-byte F2 block size for this chip and runs
the same hardware without errors.

Group the 43752 with the 4373, matching the F2 watermark handling.
With this change a 10-minute bidirectional iperf3 soak completes with
zero SDIO errors at ~270 Mbit/s in each direction.

Backporting note: kernels before v6.18 name this id
SDIO_DEVICE_ID_BROADCOM_CYPRESS_43752, so on those trees the case
label added by this patch must be adjusted to that name. Cherry-picking
the rename commit 74e2ef72bd4b ("wifi: brcmfmac: fix 43752 SDIO FWVID
incorrectly labelled as Cypress (CYW)") first is not a clean
alternative: on trees before v6.17 its context collides with the 43751
additions, and trees before v6.2 lack the FWVID framework it touches.

Fixes: d2587c57ffd8 ("brcmfmac: add 43752 SDIO ids and initialization")
Cc: stable@vger.kernel.org # see patch description, needs adjustments for <= 6.17
Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
The failure was isolated by testing combinations of scatter-gather
support and F2 block size, all at SDR104 / 200 MHz, with an iperf
multi-stream stress test plus a 5-10 minute bidirectional iperf3 soak:

  sg/glom  F2 blksz  result
  on       512       fatal halt within seconds (CMD53 write -84,
                     "failed backplane access", wlan dead)
  txglom off, 512    survives, but ~14 recoverable CMD53 errors/min
  rx glom on
  off      512       firmware PSM watchdog reset after ~3 minutes
  off      256       0 errors, but TX limited to ~142 Mbit/s
  on       256       0 errors, RX 265 / TX 273 Mbit/s (this patch)

So the corruption tracks the 512-byte block size, not scatter-gather;
glomming only amplifies it. The vendor bcmdhd driver logging "set
sd_f2_blocksize 256" at probe is what pointed at the missing override.

The BCM43751 shares the 43752 firmware handling and F2 watermark case
and may need the same fix, but I have no 43751 hardware to verify.

Tested on:
- i.MX8MP (usdhc SDIO host, AMPAK AP6275S module) with Linux kernel
  6.12.34 plus this patch

Gokul suggested having stable cherry-pick the 74e2ef72bd4b rename
first. I rehearsed that on 6.12.95: the rename does not cherry-pick
cleanly, as its context collides in four files with the 43751
additions from v6.17. The conflicts are small and easy to resolve by
hand, but the prerequisite tag format promises a clean cherry-pick,
so it would not be accurate here. Moreover, the Fixes range goes back
to v5.15, and trees before v6.2 cannot take the rename at all: its
CYW->WCC change touches the FWVID framework, which does not exist
there.

Adjusting the single identifier in this patch instead works the same
way on every affected tree (build-tested on 6.12.95), so I kept that
approach: the stable tag uses the documented "needs adjustments" form
and the details are in the patch description.

Changes in v2:
- Rewrite the stable tag in the stable-kernel-rules.rst "needs
  adjustments" form (Arend)
- Add a backporting note to the patch description: adjust the id name
  for kernels before v6.18, rather than cherry-picking the rename
  first (Gokul)
- Link to v1: https://lore.kernel.org/r/20260713-b43752-f2-blksz-v1-1-8697fcfeaef4@gmail.com
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
index d24b80e492e084160e1d085b8c20242de3e07c28..3f7a05c4d27ad4c284a6ecc7f0b014a1e985526d 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
@@ -911,6 +911,7 @@ int brcmf_sdiod_probe(struct brcmf_sdio_dev *sdiodev)
 		return ret;
 	}
 	switch (sdiodev->func2->device) {
+	case SDIO_DEVICE_ID_BROADCOM_43752:
 	case SDIO_DEVICE_ID_BROADCOM_CYPRESS_4373:
 		f2_blksz = SDIO_4373_FUNC2_BLOCKSIZE;
 		break;

---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260713-b43752-f2-blksz-efda1de3ede9

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

