Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3584F4766B5
	for <brcm80211@lists.linux.dev>; Wed,  9 Sep 2026 08:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941182; cv=none; b=PlT/locZxEHD4uZzBh802CWlP/TqUBhp0YFNy+iq8hwfzs/jDiiCgkevzo5FUmkxVRACTPJkzBb8GY4NCizgx2Z4UKA41YtWc9ruhparR+e8KT4Oh4hW0SClWMaBM8pt5CyQdA1M5vYkgza+oyiqgWcmwF3rEl3JfbGtn4Rc1LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941182; c=relaxed/simple;
	bh=b4LGCy/GrxP1awJTsj7G1lWhqhYhfO4g1y2Zo2OpBU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S8q9Zhr8wFEz1Z5zOzbK3Lp1sEOuP2gJh6yG0qKS1gX9Jpiv1nGpMOSD2P2mVTHUz5nndxRrYJWz+YF6WsjRRuwXVWdd1m6Oo9QU35LbHgSSy+yPgO3+jK8bUF9B8caWT5o0Fma2EAMojMnTwiXX/S4VrNKd1SVOWXT1xblXMWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7dNAW2h; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7dNAW2h"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2db59f54ccfso18607945ad.2
        for <brcm80211@lists.linux.dev>; Wed, 09 Sep 2026 01:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788941180; x=1789545980; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PmWvJz1TICTrxOO/Zb6x1aIAwyMn3XoHLpkJReMqVNM=;
        b=E7dNAW2hPFNc0prRXfaYfc0JPviX0bWRreqn6fG484LG3bDDYU6RQN7J5bpll9kG/W
         NRJy93XQpcJI2FeUXgKVmzHPwc+wX2TdkFyRbogwHBsZKcnrXD4E4d038vj9cb9TZJ/U
         7F0Gfgjrxfa+OlHyAvQ/eSOAJuSknQwzrinOlFWGfieAOC9mk7rV4Yy6hVQD9abTesG2
         sbQ0BTZggTv7PCMEm7NU8QMXz39KoJYKK+9RF1s4ryAGoYdc+QC16zJtEe0NcuF/hkA7
         aSvmyZntFqbA/zFHkD+GDxN0DA4ifYFM4QdDxUdq+qXwF/g5R0ee4ynarecE3F1N84ir
         5jcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941180; x=1789545980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PmWvJz1TICTrxOO/Zb6x1aIAwyMn3XoHLpkJReMqVNM=;
        b=kfWkG4PvqIV1RatEgLcTVHT3WiawAnjcTvd+AJ8JKqkbgfbd6AyLlasZ2F2AQiZtOB
         9Vuhiesflh8MX/nYJjateNmUO0RWJe6DB/AmA4SIg+RyhDa9w3LSnLuksmhfTvL8Us72
         bChkgIeMwSuHPINbAP6P8rcwXRKHGYgYUrXyyda1n0qX3O7fDLmLdAidZD25pizOrzuk
         BgPzqK3TkGQZEkP9K93UTZqXl8weCpDstrMP7XyrHYrbNGplnaJWY5UJJ0MBzyI8zf+0
         KAqi4f8Ke6Cwy38FTrhgyzj9deU64uNtzfiEdnLH/grzO/b0JOtuU+w7MiBUGzjDMOPs
         H8+w==
X-Forwarded-Encrypted: i=1; AKwUvBySlZkKZT3770jnNrnRwgsWxs1f9IKBntcEKFb4QRSUiwaZ5Rv3wDS1K4bQkzdulnlLg7Vvzo8pSM4=@lists.linux.dev
X-Gm-Message-State: AFuF++mSQ1tXxZmxTpFBo9QatZs6d2m9LU/xESbCeE5yydfGcyydovdr
	2PJIRqHr86utGEEVOw6CwLAywRh6bmbW4AnD/I176L1rq6V4qFzFFPOp
X-Gm-Gg: AYBFou18NcDJx/G0ElZFtJdBHw8ealZnxVvbNhVefAhQBRVNWdD9rR2wuxEYJ3FZeA7
	hYvqQJdUITOsHh9AG3Pc69SbI5fxeLU7p6DogD6Vv7pDpccrIYHkVIxVEx7OOUNVERdGygREl1J
	elMJofjH7UEteGs72crQojtdpTi9TgdwrHb9mn/fnueqoDpQGl27dMDi1LUkN3kyQYzgmZk/NhB
	+RsyP4tNpMRtGo//+fmRr0c71D0QK5WuwEfObeppdq3zfXKj9SGeqmA+DZM+b56tbsB3Sc9YUyc
	D1cEsxamsLx3TggPR6BrtaJcrDGsgLniecO2WYISer7Si8isJIpmn5RDAR5pwrR/CqVSfapWraf
	Kz/g2f+BYpdUjHtuvHgGpylET29K93k0mWGa6+xhPK8cpaPdN5RdfREhakDPAki+tIcoM6PCza9
	Zh5kHCEzcEt2m3tgiF1KSayr4pbpU62Dbstv5XH+FuKUDnaR/kYYuyXR7U3wRa7ZvMqMMfPi6dY
	f5oI0bWN8vxQA3GPUVWwu1NZBuevTj5EWmr61eaU06yPcqhMc+bAf0OKR4=
X-Received: by 2002:a17:903:2ec5:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2db125c412dmr528690055ad.13.1788941180081;
        Wed, 09 Sep 2026 01:06:20 -0700 (PDT)
Received: from localhost.localdomain ([2405:1202:c2a4:2d00:91c9:34c8:7e7b:4100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149c3b80sm69378935ad.63.2026.09.09.01.06.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 01:06:19 -0700 (PDT)
From: Ryohei Hashimoto <laurel.medalist12@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2] wifi: brcmfmac: log the firmware status when a connect fails
Date: Wed,  9 Sep 2026 17:06:03 +0900
Message-ID: <20260909080603.2955-1-laurel.medalist12@gmail.com>
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

bphy_err() is used rather than brcmf_dbg() or brcmf_info(): it is the form
the rest of this file uses, and of the three it is the only one that is
both visible in a distribution kernel and bounded.  brcmf_dbg(CONN)
expands to no_printk() unless CONFIG_BRCMDBG is set, which is what makes
the reports in [1] and [2] impossible to act on - the people hitting this
run stock kernels.  brcmf_info() expands to a plain pr_info() in a
non-debug build and is not rate limited, and wpa_supplicant retries the
association every few seconds, so it would flood the log.  bphy_err() is
guarded by net_ratelimit() there, so a station retrying against an
unreachable AP prints at most a few lines per second.

All three fields are printed because only some of them are meaningful on
each path into the failure branch.  brcmf_is_nonetwork() keys off @status,
so that is the useful field for a join that never associated - the case in
[1].  brcmf_is_linkdown() keys off @event_code and @flags and does not look
at @status at all, so @status can read 0 there; on those events it is
@reason which carries the 802.11 reason code, as the mapping in
brcmf_map_fw_linkdown_reason() shows.  Printing the three together lets
the reader tell which path was taken instead of guessing from one number.

The status reported to cfg80211 is left alone; changing it would alter what
userspace sees.

[1] https://github.com/RPi-Distro/firmware-nonfree/issues/38
[2] https://github.com/raspberrypi/firmware/issues/1829

Signed-off-by: Ryohei Hashimoto <laurel.medalist12@gmail.com>
---
v2:
  - use bphy_err() instead of brcmf_err(); it is what the rest of
    cfg80211.c uses and it names the wiphy in the message
  - correct the commit message: brcmf_is_linkdown() keys off @flags,
    not @reason
  - tag the target tree in the subject
v1: https://lore.kernel.org/linux-wireless/20260909064125.67844-1-laurel.medalist12@gmail.com/

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 872c488..114dabb 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -6522,6 +6522,8 @@ brcmf_bss_connect_done(struct brcmf_cfg80211_info *cfg,
 			clear_bit(BRCMF_VIF_STATUS_ASSOC_SUCCESS,
 				  &ifp->vif->sme_state);
 			conn_params.status = WLAN_STATUS_AUTH_TIMEOUT;
+			bphy_err(ifp->drvr, "connect failed: event %u status %u reason %u\n",
+				 e->event_code, e->status, e->reason);
 		}
 		conn_params.links[0].bssid = profile->bssid;
 		conn_params.req_ie = conn_info->req_ie;
