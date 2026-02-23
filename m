Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAC3265620
	for <brcm80211@lists.linux.dev>; Mon, 23 Feb 2026 03:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771815960; cv=none; b=QWBRWHBt0G5xaJWtpUlAVzRJ5+OzO7sEaFD61DL7ISrMlnSnWU9gAfsDLatdNjB6nIytP4A2XNEnjzlZt4JH6PPFYYpS9paVRTqPdufwPY+JtX3n3lpESdI2tr596n+I9h31X9wsDd4ps8RqcmB9gM6gYxmeEmDChuQ6jNiqBmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771815960; c=relaxed/simple;
	bh=i5vgvg3sg+UXIaRcyERPIMtjQmPcakNHGsM4C/i0qXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J/n3GKBaRRCVwIBCFuhkE+LHTpIQ15siRt8zinmrIo00QPTDzTHF7/5NDnRbmuUtJ890fantqKPU/L/HlRRBHCBRBlMMODNcxwmQV1XO+pG6pIdhKsJZFc83cAweZw/yLaHjBoC+kT/OQbSv7IazK0GEPN24OVygcqlwbqCrGdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqwiIUOO; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqwiIUOO"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ad4d639db3so18249125ad.0
        for <brcm80211@lists.linux.dev>; Sun, 22 Feb 2026 19:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771815957; x=1772420757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GSnvmMEphQ4/6s6fXwVUjqcFnb8wnWTRkYiCVtaRqA8=;
        b=AqwiIUOOhACPGzrTYClXUvs1iBZJlyVWat+Zh83v6XNhu64VNhMX+gvLNdDNVNGSKB
         zIoi5U5+C5dbudiA5SLVaLVUEiioqjTNiV5DSy2RgEIt8TlonKL5kbrEhUgQGZm9U7vT
         38CmGhXPhDWREq9L82DaTTRjCLYr1h8jsLAhlfwroT8UXpmXxXneR+8kUXclL4EynB0y
         k7sSU8lg48Xeer0LcBbLvgTQOfrHXnPu58M1HxudUV09aZvL84zxyAhMD3qqhHjZVAiy
         cKwkqrjDXKT5CnWB+pDgNpy02DuON9ugCUt3tEDrSoZ20+a0pddrwp0TLecI1xlqebbU
         ogNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771815957; x=1772420757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSnvmMEphQ4/6s6fXwVUjqcFnb8wnWTRkYiCVtaRqA8=;
        b=fhwnGNqkQGsSPztjpdMRtKmW+qKiOWpUDI4NbhJ5/I62vK13WnVnX/n0p5Jf/kY/HD
         Pwhef4slZIIOvaJLDJPOTQa8gh/GMA+Y7rxV49eoWeMqFAhRIpTzEjbUzdz41Lwx3Oub
         XM/PY/DJlxTfPgp7sUe4wvoZW2/rEPF0miOUCEuE4jqF+vMqn9FyyqoSl9q0E+ce24J0
         29P9tFLmfjXIzF1fyeEm8h0o5HfwHTzYpR5WWlfbi0rr/DuRQFOxJSzbSfZfDxCZKudV
         K5GHt1M1eFzVVt95AzzjA3YXRwnGrR7R0IwJcXhmJOljioLIwLRdwnMbkR2r9HUmKq2k
         xhRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAbQ6znCc3smF+m+HuT3qDSoIDNw+eqWIpwd5shzcnXJRErf0IM1xwY0/JwMXknmuScUGSKFMBgOc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwV4AnTEMiTXMS5tals4kT8ipZN0NfORvW3p395GePoAXE1vq2+
	DWcIrB7ridQJV6pnsTTf1Hy7MuChEBOZGLwcn/ciBcSIs4LI8i0RqiXe
X-Gm-Gg: AZuq6aJiVH02K4hEPKdPZ5CSFjjdl+fhxfoYI0Nndadc3KGg6E1JyyRnxvhdbeIs9Pa
	oZiZnudTYHvmQVt8tEf85Gz/+3cKUrgcdZRCn9k37tsxg5Y36mCMl1ihiKvvLxWZwOI11rYg8pn
	31fHQCg2m0jbXoqfAFYRW4r7jl7vqEAPzkEkeRgZG/ug5XZc6YL/Pt7huSBoESq6JrRqyUCmOsm
	HwIXtFAddk+XWJtRh1BjUkfm2Opz0WNdeWysUAbsRqGDfnOMZACSAUShEAUhGijXdxsjdNuXMpk
	Q0f59G+/jqjei0Mu8xJydB5toq+UCCs7icv2Q1FOqfDuFMBDAIyk1EAs9u70shLXxtsjipFiIWk
	eOhHaQ1GJvqgR9thHMuQ9MKXXElnPmxBg63OK1WudbnArIGN2wzhGIWyyMUic+19Ji+AmKKwdz9
	0kaXj1LmVCLvV4HRf0VXMh4J530/GZGRv7wJGU1ZL9YfNObmNxpSpI+VoLWBpbKdvP
X-Received: by 2002:a17:903:9cf:b0:2a0:8ca7:69de with SMTP id d9443c01a7336-2ad74540793mr68899235ad.41.1771815957390;
        Sun, 22 Feb 2026 19:05:57 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad750591e2sm56676485ad.91.2026.02.22.19.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 19:05:56 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	brcm80211-dev-list.pdl@broadcom.com (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH wireless-next] wifi: brcmsmac: use FAM for debug code
Date: Sun, 22 Feb 2026 19:05:39 -0800
Message-ID: <20260223030539.19307-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Debug code requires a separate allocation to duplicate a string. A FAM
allows properly sized allocation with a single kfree.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/mac80211_if.c     | 15 +++++----------
 .../broadcom/brcm80211/brcmsmac/mac80211_if.h     |  2 +-
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
index aadcff1e2b5d..87b636273b3f 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
@@ -317,9 +317,6 @@ static void brcms_free(struct brcms_info *wl)
 	/* free timers */
 	for (t = wl->timers; t; t = next) {
 		next = t->next;
-#ifdef DEBUG
-		kfree(t->name);
-#endif
 		kfree(t);
 	}
 }
@@ -1499,7 +1496,11 @@ struct brcms_timer *brcms_init_timer(struct brcms_info *wl,
 {
 	struct brcms_timer *t;

+#ifdef DEBUG
+	t = kzalloc(struct_size(t, name, strlen(name) + 1), GFP_ATOMIC);
+#else
 	t = kzalloc(sizeof(*t), GFP_ATOMIC);
+#endif
 	if (!t)
 		return NULL;

@@ -1511,7 +1512,7 @@ struct brcms_timer *brcms_init_timer(struct brcms_info *wl,
 	wl->timers = t;

 #ifdef DEBUG
-	t->name = kstrdup(name, GFP_ATOMIC);
+	strcpy(t->name, name);
 #endif

 	return t;
@@ -1574,9 +1575,6 @@ void brcms_free_timer(struct brcms_timer *t)

 	if (wl->timers == t) {
 		wl->timers = wl->timers->next;
-#ifdef DEBUG
-		kfree(t->name);
-#endif
 		kfree(t);
 		return;

@@ -1586,9 +1584,6 @@ void brcms_free_timer(struct brcms_timer *t)
 	while (tmp) {
 		if (tmp->next == t) {
 			tmp->next = t->next;
-#ifdef DEBUG
-			kfree(t->name);
-#endif
 			kfree(t);
 			return;
 		}
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h
index eaf926a96a88..8ef6d657e487 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h
@@ -43,7 +43,7 @@ struct brcms_timer {
 	bool set;		/* indicates if timer is active */
 	struct brcms_timer *next;	/* for freeing on unload */
 #ifdef DEBUG
-	char *name;		/* Description of the timer */
+	char name[];		/* Description of the timer */
 #endif
 };

--
2.53.0

