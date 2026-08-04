Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ADC175A99
	for <brcm80211@lists.linux.dev>; Tue,  4 Aug 2026 04:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785819218; cv=none; b=G7Ss+xC7vO2QzxrQhGvNXQbHpoYAIfzM7DHvKRDQSJbSJ7/w39y8Ql/plhJzlQehEayXrsbVWwWHu5JqXgBu2wqKK27R03+yrretdo4A3UV9IocWVhzlBNEpXEcdxCpnlZjJFqa37RzMjpe/DsOk3Q4TUQGgvbam/Ufrkmm4/RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785819218; c=relaxed/simple;
	bh=nNrXpTS5p3MeaHobweXT5nADo9ur62gwlp1t4Onq0Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hxRJrmRcuy4RfKW1w8q7eb89hx6GxagwRgCoEEhI+hRuNtJViq8QqYITDYSXyilR4EF6G2kuHkqOPh5kI+fHbKE0teG7IbU4n5orMkTfTHzlyNZcAHKAyakB/RPTB8hB64baELTyRhjk2EnXC742//IlDx8LEST6NxsPSVOXQOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHN18fcs; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHN18fcs"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-43ccd57a931so982081fac.0
        for <brcm80211@lists.linux.dev>; Mon, 03 Aug 2026 21:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785819215; x=1786424015; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ePP/FGrYS9KwAO8eWsNAP5nnVVIQOzeomHwBJLzdcl0=;
        b=nHN18fcsK/vylDa20+Nb8E/418UqGpK3aK/WS57ZKnhPwTkdEWp01yLJxkM+MVMpZL
         mZE9RQ5vc6ApqG/nysAuh5DKT+StQjqlOIj1t2ztpXHfqaU8ypeOV0hdWda82dnME6lp
         vx08xvTQCzwU4NYrR9iuiZsebxd/Bttf3gsqwhp1eI5chykpyygkj8VCHdkuDBPHvRWw
         u6Hzwf9tWWnOHbuEOUsmIR6dbXah1ROqrp/uyjHw3VLJLO/KV7agbnL+zPQ4NaHjlU3k
         njwNjc65KrmuEiFbPAsUkyEqAncfMlJawgcHgcQLQJ/mmUxllItrGCNLMOoH89KjcPWo
         CIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785819215; x=1786424015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePP/FGrYS9KwAO8eWsNAP5nnVVIQOzeomHwBJLzdcl0=;
        b=TvtQcg7h8bGMYcp+uy6vqCTvxGmkHyL7eqklWckox0O4t2AgaxFrtfxwhlAE6rUr5r
         9xg9MTx7nihZXJuVN9nHoam7EGxHFM1oRL0wx9ksA0pobOEPalrdupr2QbrW0VlX48Se
         knvZFi7iIeLBfvMcBXY9DM+38mvVmuLYMNlUO2xaAPgBtZlcw/Lk88nltLb+FeKzMvWA
         1wgn+7dZEfA+MRKFyRc71f//Lr/bE91Wf0PwsCQ1b/epo2iEf2ccDOQGvhIijLgEgfCe
         lVSUNVXoQBe02L6VL/PlwHNi54Ks0TY2SlWd6gzpTk82qaRo0gHU5JQ0pvrCPjXuSvty
         G0EA==
X-Forwarded-Encrypted: i=1; AHgh+RqHjq8KAmSxzLxUP5F3M7SCcMTRFhae8KGQJUScixieaePktOpLSkIXvJidBBZIlLd5IJWpLdgTUl0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQOLtHurUJuQIBGfV1+0cs996/GiJE1Fv8r8BNCU4FwX+z0maw
	uaVM6DyFE52mdxPLcUHX4Ee+kixcXo3u9webf9ly6kKBE1q1lGunJBXP
X-Gm-Gg: AR+sD11qLlGuGnowcw3AFD6xnqLdZrU3deI0vrbbTyFh2zlNp8t+CB6ROB1DplDChrl
	NLvaED/2vgiko9K3/pIkqAcQuqQNZOMGOCCjK2z5BW9G/WbGiwn9YRnzVeGJVVum7TqJ64fL6SG
	wUsVq968vgZZDBKH8hAVGb8ZoI4kHNH7PMRglARETanYlUp19t6FvY9O5y+Mw3egUbNrsavr24C
	FQ83mbbfTfXhuI1raUu+SQU2m2zT/iT+6DnKevwf+FsqZHoPqpIcdASQQvfSLWlL3GG4pacj+tv
	Nf4bwrQu5cKJrtVQ9y8PEIa2idQ0rmeo/gsMW5FpStnXzznjcqZNLpwwqlan1tCuHHALor3bXnR
	tUFBFMBnzDlw96x3ZhDkTYiVQncCWFNWVG15gtHi9oUbNpSfNdbSEAIH2pyD+QUbG+pb6kV+1G4
	X6NjMCYBXQ+5R2vW/2USkGwiPsYEmPA2XkubK8gtvsDxJcpEW2XyNHlM6xv8y10QxIBWe82PAk/
	bU0nsIq4ijbdBWoNm/hUByVvh0FhFSVqqnQMDte07rKy1hQ2QNW0VcvyWF7/bw=
X-Received: by 2002:a05:6830:6a93:b0:7e9:e16c:d3d1 with SMTP id 46e09a7af769-7f196ef5898mr12750388a34.2.1785819215381;
        Mon, 03 Aug 2026 21:53:35 -0700 (PDT)
Received: from antares ([149.88.25.215])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18ed3e926sm9058333a34.1.2026.08.03.21.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 21:53:34 -0700 (PDT)
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] wifi: brcmfmac: cyw: pass PMKID to firmware if present
Date: Mon,  3 Aug 2026 23:47:08 -0500
Message-ID: <20260804044708.402133-1-bogdan.nicolae@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Zero out auth_status on initialization. Otherwise, garbage will
leak from the stack to the firmware (when ssid is less than 32 bytes
and/or when params->pmkid is set). Then, pass the params->pmkid to the
firmware (without it, the firmware caches a garbage PMKID on successful
authentication and denies a subsequent association request that includes
the PMKID).

Fixes: 66f909308a7c ("wifi: brcmfmac: cyw: support external SAE authentication in station mode")
Cc: stable@vger.kernel.org
Signed-off-by: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
v3: Added Fixes, Cc: stable, and Acked-by tags
v2: Split into a separate patch

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
index 873754be5..2c59b5e57 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
@@ -200,7 +200,7 @@ brcmf_cyw_external_auth(struct wiphy *wiphy, struct net_device *dev,
 {
    struct brcmf_if *ifp;
    struct brcmf_pub *drvr;
-	struct brcmf_auth_req_status_le auth_status;
+	struct brcmf_auth_req_status_le auth_status = {};
    int ret = 0;
 
    brcmf_dbg(TRACE, "Enter\n");
@@ -208,6 +208,8 @@ brcmf_cyw_external_auth(struct wiphy *wiphy, struct net_device *dev,
    ifp = netdev_priv(dev);
    drvr = ifp->drvr;
    if (params->status == WLAN_STATUS_SUCCESS) {
+		if (params->pmkid)
+			memcpy(auth_status.pmkid, params->pmkid, WLAN_PMKID_LEN);
	auth_status.flags = cpu_to_le16(BRCMF_EXTAUTH_SUCCESS);
    } else {
	bphy_err(drvr, "External authentication failed: status=%d\n",
--
2.55.0
