Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371176;
	b=jaBln/I7JVmo4M6mzdEYJodLbBV7kE14Tsy9UtfAPrvxrK9ldWSqFZcXI79JGlLcPQkz
	 3Wn2fBJYxkuwf1rxq/HTHOVE/cPudEtW8hKgp32KU6y61/kwCiYh7iINbi084H54TdZtG
	 mNvNhxtR0XZaVvepdHvKOyt1a6KltvrMbOhaIQy3NVXHjFbgDxOVDqBYHJbEYu9aHO3MQ
	 ZoQZgKJa+D57Oy5uEnbT5f9SePdrpzmB1a9Gl6Cejq4Q9DEt4106eQ6wjHbj+DZoTKmA1
	 ByTo3XnYsQwIIiRFT4XyReH0VeuBRR60ai/VJg0fZmd8dWWdh04VImOCa1hcMRxfgxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I6I/54UthYV8T8xR4jPHmrnswiva4SFUtpc+no+b2+M=;
	b=1hUdXo3UZLoBixDk4xyTHpIpCc2RzdiW/NoNy3duQUTwv0R0aWmLmulxHIhxPg3esJdm
	 hUArRocfULgoG+Wi1ajMQNM3d7yE/VAqa5oXVXJ6IBvNQOt3qO6DKhc8YUkplRQuh2DCk
	 2h+3mar31pw9zn14/x3PvUNSVje/btAO8rx9IiEAHTJY7htfR3IUAfMoUv2Y7ZtMzVOeF
	 oZbA1O0grnB6q4M2yQg684urGv0NjRQ3mUgaCxIUyeZSczMoK78DloSIbA+mCWnorBb/I
	 oGc/r6Kv4au8kiJrFGn+gxJsjYSAdP91i9VrnbUq+NiLSOjXB7ZzJtfBgAG4b1vC6hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TXJuMQ06;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34F360A263D
	for <brcm80211@lists.linux.dev>; Wed, 11 Nov 2026 04:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D34F360A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TXJuMQ06
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so1747767a91.0
        for <brcm80211@lists.linux.dev>; Tue, 10 Nov 2026 20:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371175; x=1794975975; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6I/54UthYV8T8xR4jPHmrnswiva4SFUtpc+no+b2+M=;
        b=TXJuMQ061OPkdJ5xKYN8OiSA5CVwMSoC8gitZMo5mosywqlm2qXvAkYd9BBTyEnfwk
         fExUKOJ32+jZh8X8KDM/MTCqJ/dvDRtZ6GLfAdP1TPHakva/qKJhi8anujCP9DdjXY1F
         vs/6vuPLEuppPcO/68io3VH1M6wRaDrMerL44jg1FAEcmItuUbCPEBUSb0pU28zOq9uw
         Ea0Clw+vUAfPJke1GDjL7MTsHPJo4OQnRXtcMSiywGqKOyQKnxouMqdMvLOFeqZZHzm0
         Z8ZfNVCpTrP0gEjcuH/Q2pFxC/P+BpLD/BdoA6QS9SQJZoeFNzJOoU6s0LZopOLUmzey
         dHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371175; x=1794975975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6I/54UthYV8T8xR4jPHmrnswiva4SFUtpc+no+b2+M=;
        b=TN4z1zZCpHYquMFJRMuXl6Jg/roXHWQA3JnCrV29pLRPJsJAKCnpxYADS2cgjd5WxH
         zZdDq5/AeBi99m1+xb6H4AY6x5RBdv9lZUrf3iaZ52ZtqFioW9OMbe8/Mbvuv7RXcREk
         F/65gSWAJ6UlpBkWYZJa7Of9+uCUxXAwurw+N3UqR5KmjKAdw+8Wbc90NbhyX7aD6XR6
         ileSXnKL3ol+YnUP599O19Y6xBm9+PwmM0H4U39rXGNL0kXtL++UdJsIcBE36ysMbqHE
         wuKQ/r8FHp3bU6/SMVjEEN8AicrsARjK6qc85L/w5r+LvcPzk02SlNUTYUzv7ji38xA6
         xV8A==
X-Forwarded-Encrypted: i=1; AL+hErFJy4x6GHu1x+YHIH0u83hHmmblc/wiHM61rBe+3ltMvrY0goLK9PgJlZVQ9TYuEghfjkqkc+YHRgY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9RUwsH/HXKSh3ijdzxTHNQSloVc98pqU/jBokIY8nm1lcG/8vn
	w79U8dGKbTUiwHlgVC54MUNLaArPwhB2FDKzrfvn1eNBrgoanZRmB8GL
X-Gm-Gg: AYBFou370fXr8Ksg3BnQYIMbuNYapT/thM+0sZWVMkdxnm6r6qz4ar1iOAkeHb+uZx1
	Yn6HI4qIkewHnI3enl3C3ppo8r8wPEUeM0orOKW9h/FI3oXuuN1F75e0qiXPD/9lmCObVdNFHGW
	sl5eqiWWuoa0LrU1XW5x2C+D0StfwLL+dk+YDwjVnSU/WxioGrVgr5fGHcZ8Mjg1ZLQAHjVmv6F
	ZxIbuUpIG34dt1h/65IzAM6ppmLUE59fHQmhrb+ERPl6m5n7v0pRKP1E/3DsAmpGzRP6HtFFLgh
	3gHw7+gG/KMHEWTGw3Hj79at9Cc5mdoR4c2c5qZFxzn63G5aunpOYmTQFJD688HCPEmssb8VfvX
	zG9gekTXumzCAdHjhNy5ufIBpOkbokwAPXQsqCtB/yRT13tuBffNQZ3jTK8sKTyl0S2Gt+BMTis
	08ADZGOWHS5Zeeo/v7kwm7n600Liuia1gdALJxViWt5Oa7qE5n90wLX/hOGcI9FmvU4Sb7Fqfjk
	PhHEMCHaLR1S1M/F7ztD7RZdMLbr605AzLtLqApfwE3mxb+lRt9xdN/ii1y9EN59YVDw12Eq0Ee
	gbN6buDb4OlmzeriqLiSyg0wx1AYMgOGlInMK/mmTnNre24S656UzB96lk0AaiAJgtkaUeZk+4+
	Nn5SwqCUjm1EJLrwMKHBhF3RGSM8GYu1qTrLzGgEDcgYDhMXiuCSh+PuR5axJ+L61/gBYIUosed
	aekD+CifLqyGMhmN/Vy8ZLqTg=
X-Received: by 2002:a17:90b:2710:b0:3b0:92b2:2e74 with SMTP id 98e67ed59e1d1-3b182fe0859mr1311724a91.62.1794371175217;
        Tue, 10 Nov 2026 20:26:15 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2473927a91.11.2026.11.10.20.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:14 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 3/7] wifi: brcmsmac: embed macstat_snapshot in brcms_core
Date: Tue, 10 Nov 2026 20:25:50 -0800
Message-ID: <20261111042554.232998-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111042554.232998-1-rosenp@gmail.com>
References: <20261111042554.232998-1-rosenp@gmail.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAC statistics snapshot is a fixed-size struct with the same
lifetime as struct brcms_core. Embed it directly instead of allocating
it separately, removing one kzalloc()/kfree() pair and its OOM error
path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../wireless/broadcom/brcm80211/brcmsmac/debug.c    |  2 +-
 .../net/wireless/broadcom/brcm80211/brcmsmac/main.c | 13 ++-----------
 .../net/wireless/broadcom/brcm80211/brcmsmac/main.h |  2 +-
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
index a1888ff02d08..711e994dd04d 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
@@ -98,7 +98,7 @@ static int brcms_debugfs_macstat_read(struct seq_file *s, void *data)
 	int i;
 
 	spin_lock_bh(&wl->lock);
-	stats = *(drvr->wlc->core->macstat_snapshot);
+	stats = drvr->wlc->core->macstat_snapshot;
 	spin_unlock_bh(&wl->lock);
 
 	seq_printf(s, "txallfrm: %d\n", stats.txallfrm);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index ed022fd2613e..d000e2a70870 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -423,8 +423,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 	kfree(wlc->default_bss);
 	kfree(wlc->protection);
 	kfree(wlc->stf);
-	if (wlc->corestate)
-		kfree(wlc->corestate->macstat_snapshot);
 	kfree(wlc->corestate);
 	kfree(wlc->hw);
 	if (wlc->beacon)
@@ -493,13 +491,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 		goto fail;
 	}
 
-	wlc->corestate->macstat_snapshot = kzalloc_obj(*wlc->corestate->macstat_snapshot,
-						       GFP_ATOMIC);
-	if (wlc->corestate->macstat_snapshot == NULL) {
-		*err = 1027;
-		goto fail;
-	}
-
 	return wlc;
 
  fail:
@@ -2997,7 +2988,7 @@ static void brcms_c_statsupd(struct brcms_c_info *wlc)
 	if (!wlc->pub->up)
 		return;
 
-	macstats = wlc->core->macstat_snapshot;
+	macstats = &wlc->core->macstat_snapshot;
 
 #ifdef DEBUG
 	/* save last rx fifo 0 overflow count */
@@ -3054,7 +3045,7 @@ void brcms_c_reset(struct brcms_c_info *wlc)
 	brcms_c_statsupd(wlc);
 
 	/* reset our snapshot of macstat counters */
-	memset(wlc->core->macstat_snapshot, 0, sizeof(struct macstat));
+	memset(&wlc->core->macstat_snapshot, 0, sizeof(struct macstat));
 
 	brcms_b_reset(wlc->hw);
 }
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 8af883e40876..0e6a5edc74c8 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -240,7 +240,7 @@ struct brcms_core {
 	/* fifo */
 	uint *txavail[NFIFO];	/* # tx descriptors available */
 
-	struct macstat *macstat_snapshot;	/* mac hw prev read values */
+	struct macstat macstat_snapshot;	/* mac hw prev read values */
 };
 
 /*
-- 
2.56.0

