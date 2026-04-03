Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C952848BE
	for <brcm80211@lists.linux.dev>; Fri,  3 Apr 2026 19:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244819; cv=none; b=go+/rTua6gzEAa9jmLveRbDhoL9Rf6V8PPAImcLWp+0ukKTzd5FLCdreAGxRrGGkSQVVOEsFow4KoM1kZX+s4qE0cYpmUKPOzq9fCdjv9mbt+ZvtuYbPrOk5ZHa4IPmbODJpQsBnbb+9tn6N3eDdsZ26F8RlhFhPGmyeQ27iu6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244819; c=relaxed/simple;
	bh=42PyYXbbrCXrnlLrkcAJSkhIJKA1qYoiOfjYEveJ0/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dtr/jPiXn55HkTPTV7S8UJLdF9X+YNsfS6nzAVn6SNCIVYGSy13LqdxRmxyX6+BUqqor7uEyecvTDLFfX2nQk0Sj6vPgTExujFGO2WuHLia2u7VrXszTx3FUVz26ERW+oUTnEldw0Slc6AjtoaIEnCOeVl9lcdergueMdITM8+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldIcHPKS; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldIcHPKS"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-46fc5b8a04dso361137b6e.3
        for <brcm80211@lists.linux.dev>; Fri, 03 Apr 2026 12:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775244817; x=1775849617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OQH7/NI1jwBIKC/CRnXuSNLGKjUStOMp1+ygXfJhwDU=;
        b=ldIcHPKSLb1dq9sp23H/VqMGzemtB4V98aSyTdGt1xtZLJwMrYr/vXqZ79krK6Xtg1
         3d/LU8vz2pyS3LjyeS9ZZNAII8ijRkl0Bibq+lk4wm7drurBbI7mdoID0RiLY0KsyiBE
         JjpJCq6guBVixFFfjjyXNyJ4st0ffWgzUXHPBizOlcjvDS8VNHe2wfc5gyp1qGkdbU0e
         aJNkBmSiDBwTN8VrKpTRk93QgyuzptmTOSrioUB7T4HmMfFsMmTSIDuWvzkaW2+TA2p5
         aByo1RR5XVCwag1IKzXiSsDOmKYyBnigUpDaOKVwtXIBDL5OloXELTEYQkI8y7jGF1Tk
         wIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244817; x=1775849617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQH7/NI1jwBIKC/CRnXuSNLGKjUStOMp1+ygXfJhwDU=;
        b=H6UCeXmFXWLQpC93fQV0c5nzdVavaee9TGYP4SlB4T2Ux93uSEhous1qxYYdNlxX/i
         IccT8WfD5YTPYkM3IN/TGDqnFOBM4J4DSxR93gHC1P5+BWK5keapinQ/0pXmXHEGk8jZ
         zOiJIlf3UUJcPsNnIPOOM4Q+xDYqhQ1qsufn495UVSoQfr9CbHxKbrV1dcuSaryp0grP
         1DeUcC2a+LJtv4fSGbJwd5Wn4ry0mvCA5NCHiJqmhrYCpuwmWqZyDO/TcSPgUNqj0nQj
         fqMUDZ91/wr8h6vQmZDkfiY8lOnvyGBfwt/ZFf/O1RBeCOBuuRK0vHaOkahmeBfmNEGj
         zu4w==
X-Forwarded-Encrypted: i=1; AJvYcCVGnNSnqQRq2W+SjrAt1vSST/5tgTCOGIWLMUCABLO5cOMNTcCAffJmm4qwoPG59FH0AcysQaPnxlI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwhzfJPs3DST9pBwCaeDIHoKE+olFuts9ThKe10pMbP1DCM21r
	qXytyx0BydJmwpaS012meKqRJvUFvWrifizqssNC8eb/MdaDcVu084XI
X-Gm-Gg: ATEYQzy3r64JMxRwD33AQx9YNx4eP7kY+jhJTV6jQAVpD8hAya9H7asjRldHT/MvgnV
	mE+OSDhYW3w5Wg49ZZv/LlZvqncqLw1JgR6kuicERb2bJ1GLWq1wpAtlNaTPxF4O1RN9QhXqpOI
	6SaT9s+CHBmOnXNl74Q1iZLeEZLV8corubj1s8u718fdWeZa/19UU6LygiQT7HeKpo/QIf3IVr/
	cXzJ1DG+DHeuYz1KB97NZucL8z7Dp0L43eL4EUBj0EdUOX1OsYfM9IR330N8v1MmFyl9DDN9bke
	gCV6p07xOO+wfjII5giMTu8hrGZ5rK0QtrVqW8ey9ZEaDQX3hH1p89q5kySDEy53x21yVwnv34V
	fiRS25TxDX1G6QlPY4rE7aXmBvT517grF8Owr6ZNIpeqNTDgoyqlwiAGDmkfmtiloCyDxN/Woaj
	UkxfVi2smVMMsISyGySPg0K2V0kmJ6tVE1Cx3ELxD3lHN79yZIuZM=
X-Received: by 2002:a05:6808:4fe9:b0:45e:84e7:c20b with SMTP id 5614622812f47-46ef791a149mr2203314b6e.25.1775244817319;
        Fri, 03 Apr 2026 12:33:37 -0700 (PDT)
Received: from Linux-Ub241.fyre.ibm.com ([170.225.223.17])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46d93271094sm3942276b6e.15.2026.04.03.12.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:33:36 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] wifi: brcmsmac: phy_lcn: Remove dead code in wlc_lcnphy_radio_2064_channel_tune_4313()
Date: Fri,  3 Apr 2026 12:33:24 -0700
Message-ID: <20260403193324.141753-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable rfpll_doubler is initialized to 0 and then unconditionally
set to 1 on the very next line, making the subsequent check for
!rfpll_doubler always evaluate to false. This results in logically
dead code that has never been executed.

Remove the unused variable, the unreachable conditional branch, and
simplify the fpfd calculation to directly use the PLL doubler values.

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/phy/phy_lcn.c       | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c
index 8cec5ad79fda..d65a68045ca8 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c
@@ -1607,7 +1607,6 @@ wlc_lcnphy_radio_2064_channel_tune_4313(struct brcms_phy *pi, u8 channel)
 {
 	uint i;
 	const struct chan_info_2064_lcnphy *ci;
-	u8 rfpll_doubler = 0;
 	u8 pll_pwrup, pll_pwrup_ovr;
 	s32 qFcal;
 	u8 d15, d16, f16, e44, e45;
@@ -1618,18 +1617,12 @@ wlc_lcnphy_radio_2064_channel_tune_4313(struct brcms_phy *pi, u8 channel)
 	u16 g30, d28;
 
 	ci = &chan_info_2064_lcnphy[0];
-	rfpll_doubler = 1;
 
 	mod_radio_reg(pi, RADIO_2064_REG09D, 0x4, 0x1 << 2);
 
 	write_radio_reg(pi, RADIO_2064_REG09E, 0xf);
-	if (!rfpll_doubler) {
-		loop_bw = PLL_2064_LOOP_BW;
-		d30 = PLL_2064_D30;
-	} else {
-		loop_bw = PLL_2064_LOOP_BW_DOUBLER;
-		d30 = PLL_2064_D30_DOUBLER;
-	}
+	loop_bw = PLL_2064_LOOP_BW_DOUBLER;
+	d30 = PLL_2064_D30_DOUBLER;
 
 	if (CHSPEC_IS2G(pi->radio_chanspec)) {
 		for (i = 0; i < ARRAY_SIZE(chan_info_2064_lcnphy); i++)
@@ -1669,7 +1662,7 @@ wlc_lcnphy_radio_2064_channel_tune_4313(struct brcms_phy *pi, u8 channel)
 	e44 = 0;
 	e45 = 0;
 
-	fpfd = rfpll_doubler ? (pi->xtalfreq << 1) : (pi->xtalfreq);
+	fpfd = pi->xtalfreq << 1;
 	if (pi->xtalfreq > 26000000)
 		e44 = 1;
 	if (pi->xtalfreq > 52000000)
-- 
2.43.0

