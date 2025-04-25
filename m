Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60FE215F48
	for <brcm80211@lists.linux.dev>; Fri, 25 Apr 2025 08:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745570723; cv=none; b=nJVcwFfGFjPaVlZ8UlF6T58qN5xGrLOQkZTEwwJTgpSDDf6eqvt4kK1EZC9LR74zd+nMpxLJWE9h2ulaIfMF//HdOF56WCR9NgkcWN/TbmQHXQN+83feAglePrvtbRengjeeusjbFg/NspTxLoplSx0xpq+WG7pM58HszXZ8G3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745570723; c=relaxed/simple;
	bh=nkJItunQqSMRy+HiXddLcHeIpGaMRva1eaoplfq2myU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNVhdY2lu2X7IW2jNc+OhREkr+uD+mK4pTGU1KiMd0kmoY9naWusuRsJ7pNOWoJqEuUmiL7N9NZA6XcVaEejz4sVXzy/vPw7bbtnluTI55Xw62DymIs7EEzcgLhKIYYzBK23Www+feAJbGtjoPEz9hEhfkBUxpuy+sKtg0O4oVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bLcXEGE/; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bLcXEGE/"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22423adf751so21778965ad.2
        for <brcm80211@lists.linux.dev>; Fri, 25 Apr 2025 01:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745570721; x=1746175521; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfBR4TI6BpBz8qAAbyBqgBwhlsVjxxg/yHIslp5Eg5M=;
        b=bLcXEGE/mgVi4VAMH6m4/dvQRFaFe+yaHUWIs00lyLOLnoiEmT3uKoO33p4PWN7IDd
         +Prungk1jdw6yO7uPnSIp8lOP62+r+bLEB3eBk6RLJhBkVdcfDgIPL2it3Mmpy7k/xrh
         NGHX3LvuFfCARRz8TwSVDC2ukvMHJGn+PLJ6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745570721; x=1746175521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfBR4TI6BpBz8qAAbyBqgBwhlsVjxxg/yHIslp5Eg5M=;
        b=uiZVJv8eoA8TRz9pi95C0fSrWEULqhPYgjW1TUAJPYXcQpwraOg6ocIr89PgaZz1ho
         DlBmJxXPKHZ5asXhTNc9gHxOuhoHhbafeTEURGFpPIrQ4xgf4QgOJ7D1/1fSjYf2FRJH
         in8Jp+MPcNWok2UlXjD7QNjXRU9XKXlJLkkuqrJQjx8X93daPMYz/LdyNWN1NvJkxjLg
         p0JYH+s2rK9AqHD2W5sdV6jIa6yDSCjXy8E7SISb1kKE/OfcEDR1TzMdatTjDAPIl0Dp
         ClgHcYO5iUqsVeuaYUmK+RKHhRg4imfflnyRUEFHk6Asd1xUgk8bunsxRFg+4NYOI6uq
         DtuA==
X-Forwarded-Encrypted: i=1; AJvYcCWnraNtZ0MwA42mJrWSJ+Gq0Mxzw96gRw+okKQb0tDexGFaJK/8GGbybSrQ26Ukv7YeiVNTNJTo39Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGvAr72tck9+T1Jz5gNY1PiYXUoJKsXaiEnCkHP6tcbwBJr4OR
	FbQ1zxhgMTAYXOalFEoYkzHJcB9zHcfMHRKMdgo91qStmh5VkcEDpblyn8Oumg==
X-Gm-Gg: ASbGncuu1brS/0ys9eAF3A+eLM6QkFFNQc6BE4GT75A/gcRGBHztdEGoVeAgJ9TV9Sx
	/qu0Ox29pc3OcPaDJ7b1815HIxWbRJHDPMcplFjkNkseanSHX2FTq1FnPHw8CK8Vh/TBj4xVy4W
	xaJah8pKukyiPuNViCxw/8ESM04+WzNdc9D1QS8teAIlUuZl4uaPO+rngNTGZrvh7//8co75ZnS
	5Ccv2ntFNZQ1Pl+3kGuIQjBusK1CUgGPg3hhQcrzlmyb54iGiJxNH+jjTW2DL49WQBxPq+ajvPk
	4oBBjdT/hh/GEDXAPyslvGLb6jFWsrBRvdDvD74G39lO+fwafuf+dsq1u7d2jAwb/4VhfKxBE8m
	/UChZcFkAd4RngsGzrX6aOz5m9B3Dix0=
X-Google-Smtp-Source: AGHT+IFR7IsaZxG/pgJ9DJvv73YT4jq+62et/DfFZWCP8W95ZGuGdzpuATWSFf5IQD9HUgUEVdaPwQ==
X-Received: by 2002:a17:902:f68f:b0:216:410d:4c53 with SMTP id d9443c01a7336-22dbf640733mr22118465ad.41.1745570721124;
        Fri, 25 Apr 2025 01:45:21 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102ddcsm26883665ad.190.2025.04.25.01.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:45:20 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	James Prestwood <prestwoj@gmail.com>
Subject: [PATCH wireless-next v2 1/4] wifi: brcmfmac: support per-vendor cfg80211 callbacks and firmware events
Date: Fri, 25 Apr 2025 10:45:02 +0200
Message-ID: <20250425084505.491631-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.43.4
In-Reply-To: <20250425084505.491631-1-arend.vanspriel@broadcom.com>
References: <20250425084505.491631-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding two vendor operations that can be used to provide per-vendor
cfg80211 callbacks and per-vendor handlers for firmware events. These
two are often related to handling interactions from user-space through
nl80211. Exporting brcmf_fweh_register() for registering the per-vendor
event handler callbacks. Some other exports for get event name string
and allowing use of brcmf_dbg() in per-vendor module.

Tested-by: James Prestwood <prestwoj@gmail.com>
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../broadcom/brcm80211/brcmfmac/cfg80211.c     |  2 ++
 .../broadcom/brcm80211/brcmfmac/common.c       |  1 +
 .../broadcom/brcm80211/brcmfmac/core.c         |  2 ++
 .../broadcom/brcm80211/brcmfmac/fweh.c         |  2 ++
 .../broadcom/brcm80211/brcmfmac/fwvid.h        | 18 ++++++++++++++++++
 5 files changed, 25 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 4b70845e1a26..b9381154d124 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -6760,6 +6760,8 @@ static void brcmf_register_event_handlers(struct brcmf_cfg80211_info *cfg)
 	brcmf_fweh_register(cfg->pub, BRCMF_E_PSK_SUP,
 			    brcmf_notify_connect_status);
 	brcmf_fweh_register(cfg->pub, BRCMF_E_RSSI, brcmf_notify_rssi);
+
+	brcmf_fwvid_register_event_handlers(cfg->pub);
 }
 
 static void brcmf_deinit_priv_mem(struct brcmf_cfg80211_info *cfg)
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
index f26e4679e4ff..75f101622db1 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
@@ -491,6 +491,7 @@ void __brcmf_dbg(u32 level, const char *func, const char *fmt, ...)
 	trace_brcmf_dbg(level, func, &vaf);
 	va_end(args);
 }
+BRCMF_EXPORT_SYMBOL_GPL(__brcmf_dbg);
 #endif
 
 static void brcmf_mp_attach(void)
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
index 3d63010ae079..04f41c09deca 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
@@ -1363,6 +1363,8 @@ int brcmf_attach(struct device *dev)
 	brcmf_fweh_register(drvr, BRCMF_E_PSM_WATCHDOG,
 			    brcmf_psm_watchdog_notify);
 
+	brcmf_fwvid_get_cfg80211_ops(drvr);
+
 	ret = brcmf_bus_started(drvr, drvr->ops);
 	if (ret != 0) {
 		bphy_err(drvr, "dongle is not responding: err=%d\n", ret);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c
index f0b6a7607f16..4f76e812a860 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c
@@ -75,6 +75,7 @@ const char *brcmf_fweh_event_name(enum brcmf_fweh_event_code code)
 	return "nodebug";
 }
 #endif
+BRCMF_EXPORT_SYMBOL_GPL(brcmf_fweh_event_name);
 
 /**
  * brcmf_fweh_queue_event() - create and queue event.
@@ -405,6 +406,7 @@ int brcmf_fweh_register(struct brcmf_pub *drvr, enum brcmf_fweh_event_code code,
 		  brcmf_fweh_event_name(code));
 	return 0;
 }
+BRCMF_EXPORT_SYMBOL_GPL(brcmf_fweh_register);
 
 /**
  * brcmf_fweh_unregister() - remove handler for given code.
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.h
index e6ac9fc341bc..7fe78d41f291 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.h
@@ -15,6 +15,8 @@ struct brcmf_fwvid_ops {
 	void (*feat_attach)(struct brcmf_if *ifp);
 	int (*set_sae_password)(struct brcmf_if *ifp, struct cfg80211_crypto_settings *crypto);
 	int (*alloc_fweh_info)(struct brcmf_pub *drvr);
+	void (*get_cfg80211_ops)(struct brcmf_pub *drvr);
+	void (*register_event_handlers)(struct brcmf_pub *drvr);
 };
 
 /* exported functions */
@@ -56,4 +58,20 @@ static inline int brcmf_fwvid_alloc_fweh_info(struct brcmf_pub *drvr)
 	return drvr->vops->alloc_fweh_info(drvr);
 }
 
+static inline void brcmf_fwvid_get_cfg80211_ops(struct brcmf_pub *drvr)
+{
+	if (!drvr->vops || !drvr->vops->get_cfg80211_ops)
+		return;
+
+	drvr->vops->get_cfg80211_ops(drvr);
+}
+
+static inline void brcmf_fwvid_register_event_handlers(struct brcmf_pub *drvr)
+{
+	if (!drvr->vops || !drvr->vops->register_event_handlers)
+		return;
+
+	drvr->vops->register_event_handlers(drvr);
+}
+
 #endif /* FWVID_H_ */
-- 
2.43.5

