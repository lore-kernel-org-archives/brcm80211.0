Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426CB36BCD2
	for <brcm80211@lists.linux.dev>; Mon,  9 Mar 2026 21:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773093566; cv=none; b=ilg7lnrazTaUb3Ks2oKFs8BnxdPt+mxrHar0ClVfYhSGIDyxsSSl39EhmWt2n21k25Wx2n6bnRYQQcwR+r7Do2THcmajHK1nLu0u8VQfWxvAG3bekn/42u+Dxl0BeFuY1+L7JBY5am+U/FyPJ7VBWZA03D2ef8Adm+DVMyo0mEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773093566; c=relaxed/simple;
	bh=kObAVCbb+jpcqXP8F2TOeB9w96vxc/Xlt6AHbX5ZaNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BRaW83HWFuFVhdE5L9C/1mlKUlRZkIBynDkLWIKSrbUCvdvP3HsLaiUdMJqJs66IO0lQ4NNp4lOUi3e2ETDOlIeYSd4YSBewqPvQNruL9Aq2gaPR4WPkTNMyKszxlStNqScDAUHPe9xBd1PaTICEOfSU+8/yiP7aby7zpVLuS3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0dNZKiA; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0dNZKiA"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ad21f437eeso89031235ad.0
        for <brcm80211@lists.linux.dev>; Mon, 09 Mar 2026 14:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773093565; x=1773698365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HFThMTXhCHZfafF7yRX+oXe/JOAwoBeaEDhHGhvUqK4=;
        b=m0dNZKiA00Eii5nHbAZXcuxcW0F2aiYDJNt2urX+/Ndq9y8l1QmttVO5Vy1d5/F1bX
         hCMI71xFrhmjtw17Kr+Ds04v5Yb1EVRmV8HsANaqEQV2CVrxa649CqBI1K8WaGZOyj+Z
         EhuE50z1pGcRI2JHYT3nf8kugEMjuCzpa1BsRPgYD4zFWIFIicFuxuGiiingOw/RSFtW
         hvRXMyJkWrK0m5cavU5mtKp4E0609bhVzSkwTb4echuXm4mC5mLO4R/PYvKLdGMF94Rk
         lKmr2I8cpZ6F4aH7H+GJniYVexZXieqLeWB0ajp7NGPy+AL7m50puK/NcP1RhPmNwqov
         NTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773093565; x=1773698365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFThMTXhCHZfafF7yRX+oXe/JOAwoBeaEDhHGhvUqK4=;
        b=AuXPCCDsTCjvXXgUPQsn0pTlnO5eql1vpo003YW7bw1EMcqNEKCxVEqgsPNJQRHDPo
         VhKC91U5Cj69lHbpPfFYjEd3cds84jDL4ahZcYYFBhNv/0tibwbrjFWrpNLz9m7Jfqle
         RPsyut8otYfAG/Z9vtfQwmIyzSSi+MQroNKnOCWhkAQEIiAVkDcYyqwQjUhc31u6Ghsv
         sRyTOp4AOpY1WmAsfFg5Dvt+OQwqnlCJ44Nnp623DRnC31FHaovCCwvXALTws1E4odZB
         0gWJywxNyOBuqTPS9vPcc1tYDJyka57vFL14wVrSEHMWvUBgqF1HPbM6psX6tYehHhqw
         BGog==
X-Forwarded-Encrypted: i=1; AJvYcCWElqAltrVYMmS/WH37byiOIGPR06VIpk7x2oMKUeXpc43JgxrcyoXCciThTwDdKJI7j4X4o1uPY8A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyk1PJXQRzGCbesbuF0jeekGTJ3FRe5NA4Qp5CCQg285/m7yGDU
	lFdqkGPDjH2B/02bpLAJ4fSFA9Q7QtT1YOVzuI7FMYwJUUasapNwkzzh
X-Gm-Gg: ATEYQzzltZLAUTMPxIklKSXR4ctuw+msOdY7KtdrllEyvBHgOqnmi+vr5GtkMnUAoAS
	+a3oKfjoeRDbt7gVR3vYq06+Nkn9LtD0+QnnME2/JRE1L6tYG+VY4PV+yFQsPeA1gIyhTXLlaWn
	pYthYlRxigycwkZp3ELYZ5hzTb1Vqhox2sPygiRrd1JaNHvana3Ehhfa0t9QZnuMLnlCVAv8a+C
	E1Plr3n4l7ztPZ0QmJJaxPEuPkxKjlHQZtVJ0yc1l0xOAYFC8++wH9GuZQjAQ2x+jtSC8HVNlA7
	fJHgTzoXQdVucVDX+ayB6zQKknwPxOjb/e7dV9/kxUepO+FshmeDkq/7j02hlPjgfRDQrRibvNo
	eCOJTbfy29zux+zhzeAOyuFpFwT+GpZeZjwVJAbvnAyHoEaBGqi+lcM+0FKARTLNSD9U11XHKoz
	Z3opJh8YOZn69HNDzjDxpJ2Lex025NEdNHJg50D6veu8+4R3TUw7NyWg==
X-Received: by 2002:a17:902:ffcb:b0:2ae:5c39:89c9 with SMTP id d9443c01a7336-2aea2036f7dmr8927095ad.24.1773093564589;
        Mon, 09 Mar 2026 14:59:24 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83eafc64sm169450715ad.40.2026.03.09.14.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:59:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	brcm80211-dev-list.pdl@broadcom.com (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 wireless-next] wifi: brcmsmac: use FAM for debug code
Date: Mon,  9 Mar 2026 14:59:07 -0700
Message-ID: <20260309215907.5789-1-rosenp@gmail.com>
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
 v2: rebase and remove debug from member.
 .../broadcom/brcm80211/brcmsmac/mac80211_if.c     | 15 +++++----------
 .../broadcom/brcm80211/brcmsmac/mac80211_if.h     |  4 +---
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
index 6255d673d2d3..7912a999f6f7 100644
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
+	t = kzalloc_flex(*t, name, strlen(name) + 1, GFP_ATOMIC);
+#else
 	t = kzalloc_obj(*t, GFP_ATOMIC);
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
index eaf926a96a88..3b25a56958b3 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h
@@ -42,9 +42,7 @@ struct brcms_timer {
 	bool periodic;
 	bool set;		/* indicates if timer is active */
 	struct brcms_timer *next;	/* for freeing on unload */
-#ifdef DEBUG
-	char *name;		/* Description of the timer */
-#endif
+	char name[];		/* Description of the timer */
 };

 struct brcms_if {
--
2.53.0

