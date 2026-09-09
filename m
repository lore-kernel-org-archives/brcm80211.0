Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9093A7852
	for <brcm80211@lists.linux.dev>; Wed,  9 Sep 2026 06:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936141; cv=none; b=I5rC3bltuuOKBDWMHoqaieIct6Oqd6ll0HwugmeAasZY1IuDNsFvs4Rw/veYbtbY+9khDE7aDTzAhuxiWZmMDkLt4x2bsE6PUPHFYfUV4tNBXKc2MSkDdWTHYvg4/OU2HVVuHqALGk92zVHw+6UYfWj9/TyMDO8rH1OnmdfK6g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936141; c=relaxed/simple;
	bh=iDybumrrIViuDLFcgCBzA5c0ljgLQ9G7vLoz9kImh+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nk5KHGsuExoU8jeGpcSSgT01GKy/qzFMQ4g08TI7SvPhHVM1DUxGerPT/hIX+eW6RYdtpmkB7Hu0dc7wayV0kLKLGjdXUGlxD8diOp3BpG1KbpylDow9VSx0+UTVmQSHhrzWui/NB2zor9ijgMrO1QwsZhx5NIlVI3Xb9faenJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GyabLB9V; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GyabLB9V"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d715f4a587so76424815ad.2
        for <brcm80211@lists.linux.dev>; Tue, 08 Sep 2026 23:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788936139; x=1789540939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CxZ7rOe2cp20uhhw8BfBShBPGU+l2Fa3Spwjm/FWLyE=;
        b=GyabLB9VvJw/MukZnhaMXk7GuqKwFeX2ItU6XIB7U+pLdeURZHnT3mzd+TfeNiOYxa
         Hvjx+uJtsIZv4yzhobzaOEgKdbe/avdHH3kMLDbmOUcJXecTBULBsaUvZaoVoO/BUjlN
         efOEcebs5Uc2sPV2ZWX8V/nbk30/jSaVLXETgTDf+qfCHpamWF/wGzTZlysp1vpFWFkO
         rX+yN70eWz9AZD0Lip3cTyojN0x1+NT1YeWkdw/laztw9Va9X1eiyOuZotOB5D1x5903
         1GEcQGCXOL7Xonn9VuzeQAnDILZzO/KQmqdqGCUVsCrYT+XOj9pieNTse4+OF4x4w8pX
         J5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936139; x=1789540939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CxZ7rOe2cp20uhhw8BfBShBPGU+l2Fa3Spwjm/FWLyE=;
        b=HrFcMfxaEaeInIuT8ydm2aiCdHq3N8CEqIq/Zpis5MbhvKqwwDtHsDxkQunAZ5QDsP
         gp3EzQy6H0aTeCxGZyMSb4BBN3t9Ryn/DxIfJeKQEGcD3JMAJu81C0xz003/3PQESpXl
         /o8orFb74dfX9KD1/cpAI9z7kUg0l2Znj3iLWySUCFqeP1tVrLNnjYGVcCjPIKl/U6jY
         GlwBJb3hAkjbWtxvAiRZyz1/THhjxFLIWQTZUw5rroYA9vYOEwuYixWWwaVmJhlJyjDz
         jbf5/vNvrHYpbTGyK1O6Jz3CX/D2hfoNF13u53LvspJDffOIuRVE19VC1ygRY6Rp37Id
         XDrw==
X-Forwarded-Encrypted: i=1; AKwUvBziujuEWZaOIRIzhGRMM2PPwQqy7euAODP4/grmuydzc3hV5oiM/0ko0e81kgwDX8ROEPJSwZFTtXI=@lists.linux.dev
X-Gm-Message-State: AFuF++kgYP/ajgfSoymRD4b/0Fzt/2zwrqwc9ysOpJpHnEg+aBJ4Bedy
	tVxbuBK5BeiAzPztehKroMB2QMtyw3br9o8estlonbkONsUw8rAYXOO0
X-Gm-Gg: AYBFou0y6ixWNcNpt1IpOJnrEV/XvgiLZLydyMoZaY+UKJDG2noZXtyT4AfrPr97Nzi
	ZT/qxBEtdtOEThrzRmLDMDr4ZrznZ3vQ5lYsYY475P6jIBWi4mEaq0fCnNwvKSt7K/gx8VOSoq9
	BEgE/XAzjsdWG3koUAVhKMWyDX+6S7yqfchfjjnBfC+e2ZCsCsxQnRn+DIiBQ8vW/3drxbTphqs
	Uy44VpHntFHgspXVt4JKi1QLoqBRKqtHqUDm6yGXHm7HODts4kqk27bKSBfo+qLPtjyp+Fi4TJu
	JFmdGI9TasCVjymNHBy06z6fQTwQtCXOZCavuKKkekTeulLbZvvq3jifssgRb5yGhIItLvYSOKL
	tDJ0x17GfIjz095B3mj4g1LYZeQlF90chSlX0PGsE03OSM+ICH7w3ib48xlT+FtTZjPwioedtiS
	Kq6s+/JLafX50u7CJoUaLlBKN9Tr0+UQcFXcR28hzhLfySGKDh8u14GDdF2zZrJtz5qOKh3dcix
	sk3KDXkKvrqgyJlwk2+eJqtojsWQLB7NjmwjVUdoCTQWnkUwmfs+U96dCY=
X-Received: by 2002:a17:902:7788:b0:2d7:4cd4:5a7f with SMTP id d9443c01a7336-2db127c0b20mr362659145ad.12.1788936139312;
        Tue, 08 Sep 2026 23:42:19 -0700 (PDT)
Received: from localhost.localdomain ([2405:1202:c2a4:2d00:91c9:34c8:7e7b:4100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149c935dsm67295055ad.64.2026.09.08.23.42.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 08 Sep 2026 23:42:18 -0700 (PDT)
From: Ryohei Hashimoto <laurel.medalist12@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: brcmfmac: log the firmware status when a connect fails
Date: Wed,  9 Sep 2026 15:41:25 +0900
Message-ID: <20260909064125.67844-1-laurel.medalist12@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

brcmf_bss_connect_done() receives the firmware event in @e but discards it
on the failure path.  Every failed connect is reported to cfg80211 as
WLAN_STATUS_AUTH_TIMEOUT (16), whatever the firmware actually said, so
userspace only ever sees:

  wlan0: CTRL-EVENT-ASSOC-REJECT bssid=00:00:00:00:00:00 status_code=16

The all-zero BSSID comes from the same place: conn_params is memset to
zero and profile->bssid has not been filled in when the station never
associated.

status_code=16 therefore carries no information about the cause.  It is not
an AP response and it does not mean "authentication timed out" - it is the
only failure value this driver can produce.  This is a recurring source of
confusion: [1] has been open since 2023 with more than twenty follow-ups
and no explanation of the code, and covers BCM4345/6, BCM43430 and
CYW43455 across several kernel versions.  It supersedes [2], filed against
the firmware repository a day earlier and closed in favour of it.

The firmware's own status (BRCMF_E_STATUS_*) is more specific - FAIL,
TIMEOUT, NO_NETWORKS, ABORT and so on - and it is already in hand.  Log it
so the cause can be narrowed down without rebuilding the kernel.

brcmf_err() is used rather than brcmf_dbg() or brcmf_info() because it is
the only one of the three that is both visible in a distribution kernel and
bounded.  brcmf_dbg(CONN) is compiled out without CONFIG_BRCMDBG, which is
what makes the reports in [1] and [2] impossible to act on - the people
hitting this run stock kernels.  brcmf_info() expands to a plain pr_info()
in a non-debug build and is not rate limited, and wpa_supplicant retries
the association every few seconds, so it would flood the log.  brcmf_err()
goes through net_ratelimit() there, so a station retrying against an
unreachable AP prints at most a few lines per second.

All three fields are printed because only some of them are meaningful on
each path into the failure branch.  brcmf_is_nonetwork() keys off @status,
so that is the useful field for a join that never associated - the case in
[1].  brcmf_is_linkdown() keys off @event_code and the 802.11 @reason and
does not look at @status at all, so @status can read 0 there.  Printing the
three together lets the reader tell which path was taken instead of
guessing from one number.

The status reported to cfg80211 is left alone; changing it would alter what
userspace sees.

[1] https://github.com/RPi-Distro/firmware-nonfree/issues/38
[2] https://github.com/raspberrypi/firmware/issues/1829

Signed-off-by: Ryohei Hashimoto <laurel.medalist12@gmail.com>
---
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 872c488..114dabb 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -6522,6 +6522,8 @@ brcmf_bss_connect_done(struct brcmf_cfg80211_info *cfg,
 			clear_bit(BRCMF_VIF_STATUS_ASSOC_SUCCESS,
 				  &ifp->vif->sme_state);
 			conn_params.status = WLAN_STATUS_AUTH_TIMEOUT;
+			brcmf_err("connect failed: event %u status %u reason %u\n",
+				  e->event_code, e->status, e->reason);
 		}
 		conn_params.links[0].bssid = profile->bssid;
 		conn_params.req_ie = conn_info->req_ie;
