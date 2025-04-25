Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3478E238D32
	for <brcm80211@lists.linux.dev>; Fri, 25 Apr 2025 08:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571331; cv=none; b=qF+jK2QbzVzipl89BIf6UYbqKEDOGbi/DXVEOcimA9TptZ7HuzqhmX7cXW5piCR2/1LBChNrWRFfSxynghl6fVHIL2TQlzBiKtqJnVN0P4kQkUHeKlFG0KNuH7wn3tgRdpKhHUGJAWwNBrcE4+pUgjCpA4Ux5PkUhgN6agJ2awM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571331; c=relaxed/simple;
	bh=nkJItunQqSMRy+HiXddLcHeIpGaMRva1eaoplfq2myU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYNF4ZNeGLBDtN96a1ienYgZcXmK4/4G21MDW7i67BQKaaIgZadQl2w+NUFyWUY9Xz5LrApe2Up9hL0XXD7eoooTQq5cJsCwYl8iq4/aZgPWtGnDOUTXFUNT7nZhQJpp4MWo0ef7wWlqituBVogf/9BM3Mb2rt4flbmp8OEHwS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UbePqRXB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UbePqRXB"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227a8cdd241so27470145ad.3
        for <brcm80211@lists.linux.dev>; Fri, 25 Apr 2025 01:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745571329; x=1746176129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfBR4TI6BpBz8qAAbyBqgBwhlsVjxxg/yHIslp5Eg5M=;
        b=UbePqRXBpS7AmphnxXhX7ZsCpm2m39xKkY/dzrORGdPnmjm7Rqs9yYFXtII3eotIXF
         Cgg0QC3XLuzHkE5/FffPBLVKBlLIB7cenV2OBeGtR9uSpe/CB9F8WLWgsKrZnwvvJ9pZ
         dMIYnqaWW/3L9z04JJH/Jup9pXyby1fsD5azA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571329; x=1746176129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfBR4TI6BpBz8qAAbyBqgBwhlsVjxxg/yHIslp5Eg5M=;
        b=kSHD0dxc2rSX53S4Lk2fCJKg77iFquhzUa6Wu/7mmznXuqvnQ/OyOPEkAxNvBpx4aX
         T8qeMvFLbi/1LQAIXu1k3jt+5OsDC2bmkpMezcMj5Fyf20clYU9VAoCXA9VzaLx3KqhE
         rOS3hsKyGfrsYWPmD1bD4GZrkJaj/w5jUAm77Cxh9iY+zKpuuyII1Ccn9ryh2Bvz5Xpb
         A+nsh7uPCdX9KH1vXevSUu9g5oQqIMt0MxdDZIYZu6b797Nzad1lbsl9a1aiOKUhPsHh
         tk6i2R3JIBhhbJC67Fx5KInatmzCd9Q2b14hRvVMr1kb+BMOFfdvpJhoXc/d3cATn/WM
         x2bA==
X-Forwarded-Encrypted: i=1; AJvYcCX786dAdYTDoxONjB9lLjn/BPrKRF8n5B++UdODXo5MPC+adoyQ6LMRoW6hCQ1u2533+ZEikbB2HOI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhS7ymoQnC5R8+4rvMhqJ+1CkmdYDFkt7XaBfuS7S5E4XpySTd
	ao2bm6A2JceGAviJaQ1hpdc3GNid0qO2J+hOQmeozHUEtNcdna8Zny+TMrprcA==
X-Gm-Gg: ASbGncv8r+rBL7AC1c8QhCuhfCtmNvfNFEg/1YvvFJRYQtUi+9yEed4QUnjeJ0ZsjDK
	uyKAHYEwl/bw2yhFnJ+QrHWF/5gFEi48V52mm0Qo2SxoZz8TDKwe/GWPDYXuTrckdjPtFYbSvHH
	2W1OxgA2d1f1//sRZuNCmCS+tfwqFflSjj48VqQXkEijKZStqZ+UCdowYNTfh9R5rF+y1zWz/sB
	MQUppHJSIRL2Br72+2CDnDpEidp3UbQINswBMPF+HMftScxRmFE/hgNutbrD/AW86rENtnb9mXb
	U322SiYbGFrVq1iLOuIlR6lQaaq1pRERAnpFrJimt7pBBuPa0hB0OI79YMPS+TECap4p/En7mnO
	mqCkXfkuPHqxF+DHr4XSt
X-Google-Smtp-Source: AGHT+IFh27RuF6vdvrAtFWO6WSPyyAlGfUA11OCzAC9TKvBtpevYkEHcV/6xvlrKX4ja5kt7DCzMgQ==
X-Received: by 2002:a17:903:40c5:b0:224:ff0:4360 with SMTP id d9443c01a7336-22dbf633bddmr26427335ad.53.1745571329478;
        Fri, 25 Apr 2025 01:55:29 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221943sm26988875ad.249.2025.04.25.01.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:55:28 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	James Prestwood <prestwoj@gmail.com>
Subject: [PATCH wireless-next v3 1/4] wifi: brcmfmac: support per-vendor cfg80211 callbacks and firmware events
Date: Fri, 25 Apr 2025 10:55:16 +0200
Message-ID: <20250425085519.492267-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.43.4
In-Reply-To: <20250425085519.492267-1-arend.vanspriel@broadcom.com>
References: <20250425085519.492267-1-arend.vanspriel@broadcom.com>
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

