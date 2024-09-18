Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413401CA68E
	for <brcm80211@lists.linux.dev>; Wed, 18 Sep 2024 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726686686; cv=none; b=IcxhhAIX9wlghQOLRUm4oNVqGhfjxnH1nK5q7P8t2qOJJYqcLwKxQ5CWOziI/NFoH4o2n6Dg3Yg+tbeFg7z0CvIRgXtXR0dUN03VT1Boh7gY8o03WSOcL6odFlAgk2JkrENCYjDbFH67PaAztKLB15ciULXSIsHGpwU6YVxegMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726686686; c=relaxed/simple;
	bh=tnEFg2az12D12WYPbBIgdNbXt54tlMSTGXLZ62UhK+0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=up1Si0gCKcQ6y+Ue413XNS0NrPH4nafBgTZX0E3xEa4lxeAcbvlvvP4EgDkXsNi4CG57ksPrxBGwCTUXNwxjQ4lFgiLviLSVDkKTOLPH1M+WK/RHZS8xOGPQRIsjBaSD92PQuMiMWNZTRtLZYLBVfu0t1zXcvH+f0l8/jMbeTvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=T0CJ3oNu; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="T0CJ3oNu"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7a9a7bea3cfso4414285a.1
        for <brcm80211@lists.linux.dev>; Wed, 18 Sep 2024 12:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1726686684; x=1727291484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6+iUHts2ufPMFsssvvBzuR1afFod8F8y5QRxPvLSaU=;
        b=T0CJ3oNu4gEwkJQsRa1jKDQwD7jJdDmYkGG2DBfSMT4gmQrDnzkAsOm1VjT6BO1/kz
         czc4I55mpobAnoDwx/EfbnV/0IZh/DGerVzN7KPfTaBK4FaTEwPuM/urEpoT6ijS2bLO
         CCL2OYsoP3eAS2Hn+uObkR220bBQoj2a+ZbeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726686684; x=1727291484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6+iUHts2ufPMFsssvvBzuR1afFod8F8y5QRxPvLSaU=;
        b=UfL+4cl9kdLeXx9eqKbgAOUi2hWGWccu6oVP9hLnTJyZ4Q9DtkRCuzj+ux+NAJAJSl
         kmAwrSfQmGzr+Re3SLNH2ukcryZWOk90hdrXmlrBimy6CpHaA5p8hIHEw8M2wBt/MMdw
         3Jg0v4lMOJZ02L9eX/uXoqEM7jhtPvoeR6wtJcwY62V/9o1PQ/a8obFpjcwwr/KW/ij6
         PQ/OiPTmW9t6+NU4S1C2J2c765M8PsLhXjC638ZvkjSImXgNQuDngheyhbP5SWgJ+T2h
         N1C65IZmmnlxAM1vZbIvNGvIKICmUICgUg1jDvF1KF11bELAacvsZ9S+PLLgVm63Mi8U
         4Org==
X-Forwarded-Encrypted: i=1; AJvYcCUU/SA8lEYS/lGoDv1lGYaxJZ2Usx+qxSs7ozrH4TSxInuN5/ips/D0apdgjWUaXuL62bP+k21lMPY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/ZGTM4Dm38XUTZfjEG0g8jROUOKJTZ5i1czpisPQvsfma2lTu
	cjgHa+nmFB1wgYp7jdnRAaLu7w4TWKK7+4HmO1MRGGoA0om8WEqx/cXigAwfVmkj9ssdwqycv8p
	9uw==
X-Google-Smtp-Source: AGHT+IE5TvhzBZQLA0EnW+dfAT1nmwn3T+cz/lTdAIbaLUmIwAjpTYhItAqJRYA+tNxYRBMwK8sWdA==
X-Received: by 2002:a05:620a:2801:b0:7a9:c610:9a0a with SMTP id af79cd13be357-7a9e5fa0aecmr3623288685a.65.1726686683987;
        Wed, 18 Sep 2024 12:11:23 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acb08dae51sm2275885a.122.2024.09.18.12.11.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2024 12:11:23 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [RFT v2 1/3] wifi: brcmfmac: support per-vendor cfg80211 callbacks and firmware events
Date: Wed, 18 Sep 2024 21:11:07 +0200
Message-Id: <20240918191109.41960-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20240918191109.41960-1-arend.vanspriel@broadcom.com>
References: <20240918191109.41960-1-arend.vanspriel@broadcom.com>
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

Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../broadcom/brcm80211/brcmfmac/cfg80211.c     |  2 ++
 .../broadcom/brcm80211/brcmfmac/common.c       |  1 +
 .../broadcom/brcm80211/brcmfmac/core.c         |  2 ++
 .../broadcom/brcm80211/brcmfmac/fweh.c         |  2 ++
 .../broadcom/brcm80211/brcmfmac/fwvid.h        | 18 ++++++++++++++++++
 5 files changed, 25 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 349aa3439502..92e310f7f2ce 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -6752,6 +6752,8 @@ static void brcmf_register_event_handlers(struct brcmf_cfg80211_info *cfg)
 	brcmf_fweh_register(cfg->pub, BRCMF_E_PSK_SUP,
 			    brcmf_notify_connect_status);
 	brcmf_fweh_register(cfg->pub, BRCMF_E_RSSI, brcmf_notify_rssi);
+
+	brcmf_fwvid_register_event_handlers(cfg->pub);
 }
 
 static void brcmf_deinit_priv_mem(struct brcmf_cfg80211_info *cfg)
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
index 58d50918dd17..1df05a0b83bd 100644
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
index df53dd1d7e74..b876c20e3af2 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
@@ -1359,6 +1359,8 @@ int brcmf_attach(struct device *dev)
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
2.32.0

