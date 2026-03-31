Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE8E284B29
	for <brcm80211@lists.linux.dev>; Tue, 31 Mar 2026 23:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774999978; cv=none; b=EkMaaHsGUfuRRSYiVSDGk0Ne+5uFkn2A4VQoJTmJWSroUXrXrNf9H/ktnrJnsKxEZ8I7YI9bfRMT1fuu9/QuwF2FNzzzGnZWmbVbmSmxOGtB83UMcug3ZNA1JCuQ0psOu3wiS0yhQjHEN1Ppx8i8XdoPBMMS0+1Bt+7ziFjQklg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774999978; c=relaxed/simple;
	bh=244mleRO43LNTUCWzp/ZKAnyfQyLqVy88A4aiCBlJ0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O6/xzvwIJiGDk7tFOEAnYY4/sMg6ERefsbEuPQTYSoeEmBhUbANpNmA6vp+m6NDuAs8h+SWidFkBif6sc8J4vf2YcCxsZElBL+d7MAA12/ruDU7TDS+MAiFa+3CrSIKGAP8mICye5yDniBXOlaVWl2Pg8e5PKuOvDtlGEX1tw3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIG6aENh; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIG6aENh"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35d94f4ee36so2233722a91.3
        for <brcm80211@lists.linux.dev>; Tue, 31 Mar 2026 16:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774999977; x=1775604777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=adQV9YrsC4jfyVUOST6M3hgxRoSvm9YrFP3OZEy1JPc=;
        b=LIG6aENhrWPNnNy1p6uSakmL7LGjhFRfIso6KaXXYh4LsAoiFBOp4lB16RZ1tcued7
         H0neIk4TfrfFFGDSbWMHVGsyC8JhW3DwZ4GhrwHR3isjh7a5DWPEVwZ2HBKBe4Z51uk1
         +6T94+DyKRfRfow1b0q7NInVw4lHyrAZtQZV0MbFh+CHzgM+M8xrNLGN8pKQzfNjjIxf
         o2S/VVGFvylm4aWO5trNqbqI7ebi9/9a3xOObPwzqgMrk73abD7PunYtXHrpn0A1yYEf
         QA495oLbTsZvtF7g27nOrUHDfNUW1Jie3BWKCjSajrx7D6UTu1RJUpyHkG2vFEYcm9BQ
         HYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774999977; x=1775604777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adQV9YrsC4jfyVUOST6M3hgxRoSvm9YrFP3OZEy1JPc=;
        b=ABVRaDAKR8deiQlxMlSO58WAYDoQpaWEF1uD1+irHhp2Ge90qPh13llLH67HEEq2ir
         V+Gd/d0aqsrsJnBjeDNxPKBeV9qb/y03vrg2vxGJpNl0tY4Z1xP77HbUzKxyUYEp8DdA
         pMzEInrytFxvZrbXiKE848hPXzOvNTpZwzUNTZzgAj/POCg7A3rGG3kNioDE4PFhKHbJ
         ovfGAs9G/hGpRp2moAXq5bq65G6zEQh15bmzOs5/clKneh8bdHNxw4cDwBiExqrT/exm
         kSPNXUPBGwkdTgOa74vRLxoiqtgU2LzVkQN8MNl2VTMgFSe2CmmKqkeEAN3cc/QTdZ3l
         xdFg==
X-Forwarded-Encrypted: i=1; AJvYcCWj8omPV6gqRpgtNyfkmWPAlYu9BkVG4RxLaw5JlLnfyqwKmV7Zed3DTf+Z75uZ9SutRIhdP/RGsr4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzks6ZLFV+kQytac62q3Slpdcf56yELBHXKEszFuoPeQQCHe1h6
	UP25hZ4uPAhr1t6ww635+/9XvvgPMlWgvzym+8slHAaW0QTnnIPULOQlJsKL7Q==
X-Gm-Gg: ATEYQzwh15HKQrwHJPwnaywCLpF+YVC2W4ufLxRtc+vmvexE8IYiyqexzwDeRHfUeYA
	AYENeT/SmgaHk2PyQj+FG//2ekpezGhuta56BoDoEnf+7IHfhqQn14k5AP/YtaOvih+51Zbu0rM
	4n8YZrqsEYbyY7SFnwek66KulhtlzUfVm1UgBYdMmiw8mh9pR54WaU422gQ9TJVyBoO3Ryj7UF/
	phNi38yl9RxwZWJEe7Z2VLnWsoOGH3FmzT+moe8UXG80oPloVE4FAuGgUm+YLjtrZitEhkYTsOl
	8omPLXDfadZClsE1amK96dekEgjAH9wUrG81eDWyqR/6vS/46U0uTRkGNbykX6Xu94bEec8uc1c
	0T5s4AJOHL9FGo/b0Zz3KW6KxmeBq5has68kJnMnRd1bODXNJzcS0DSQECFLlJky3uU4zXyVovj
	Z/EXVIdnfgFO7r9X7lI7VxmsWhs7kZ9mzN0NVJKjziy6AYEH67hPTFeCM=
X-Received: by 2002:a17:90b:4c:b0:35d:a62c:19de with SMTP id 98e67ed59e1d1-35dc6e7aabemr987113a91.1.1774999976654;
        Tue, 31 Mar 2026 16:32:56 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe6d8682sm2775605a91.14.2026.03.31.16.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 16:32:56 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	brcm80211-dev-list.pdl@broadcom.com (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH wireless-next] wifi: brcm80211: change current_bss to a FAM
Date: Tue, 31 Mar 2026 16:32:38 -0700
Message-ID: <20260331233238.23527-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change to a single allocation with kzalloc_flex and remove some
boilerplate.

Done as a FAM instead of value to keep -> usage in codebase.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/main.c        | 32 ++-----------------
 .../broadcom/brcm80211/brcmsmac/main.h        |  2 +-
 2 files changed, 3 insertions(+), 31 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index c7eaf160e1fa..4f57d64b1dd3 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -418,21 +418,12 @@ static int brcms_chspec_bw(u16 chanspec)
 	return BRCMS_10_MHZ;
 }

-static void brcms_c_bsscfg_mfree(struct brcms_bss_cfg *cfg)
-{
-	if (cfg == NULL)
-		return;
-
-	kfree(cfg->current_bss);
-	kfree(cfg);
-}
-
 static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 {
 	if (wlc == NULL)
 		return;

-	brcms_c_bsscfg_mfree(wlc->bsscfg);
+	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
 	kfree(wlc->modulecb);
 	kfree(wlc->default_bss);
@@ -453,25 +444,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 	kfree(wlc);
 }

-static struct brcms_bss_cfg *brcms_c_bsscfg_malloc(uint unit)
-{
-	struct brcms_bss_cfg *cfg;
-
-	cfg = kzalloc_obj(*cfg, GFP_ATOMIC);
-	if (cfg == NULL)
-		goto fail;
-
-	cfg->current_bss = kzalloc_obj(*cfg->current_bss, GFP_ATOMIC);
-	if (cfg->current_bss == NULL)
-		goto fail;
-
-	return cfg;
-
- fail:
-	brcms_c_bsscfg_mfree(cfg);
-	return NULL;
-}
-
 static struct brcms_c_info *
 brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 {
@@ -527,7 +499,7 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 		goto fail;
 	}

-	wlc->bsscfg = brcms_c_bsscfg_malloc(unit);
+	wlc->bsscfg = kzalloc_flex(*wlc->bsscfg, current_bss, 1, GFP_ATOMIC);
 	if (wlc->bsscfg == NULL) {
 		*err = 1011;
 		goto fail;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index b7ca0d9891c4..e9cbb95a5a17 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -614,7 +614,7 @@ struct brcms_bss_cfg {
 	u8 SSID_len;
 	u8 SSID[IEEE80211_MAX_SSID_LEN];
 	u8 BSSID[ETH_ALEN];
-	struct brcms_bss_info *current_bss;
+	struct brcms_bss_info current_bss[];
 };

 int brcms_c_txfifo(struct brcms_c_info *wlc, uint fifo, struct sk_buff *p);
--
2.53.0

