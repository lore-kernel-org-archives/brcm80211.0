Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F55357D07
	for <brcm80211@lists.linux.dev>; Sun, 13 Sep 2026 16:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789318542; cv=none; b=QEtGr3uaexixTfeX/v7TelyUD2CQ6FKl2hxTzcfTPmL2rvaRM/Jbt1gL5oWS4FVwwzDXL+PYW5zTrbztDksiePMlhP2fDXPZhDAq2ruQJx0qACgiKltzZe90Ixv/dF6WDLHGkY6JBXV7ryTduYWfEnz5ilFwPP7OLS209OpRaOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789318542; c=relaxed/simple;
	bh=nzf2EwG7iPP6tj9ibZ/1X/63091RhG8SeD7SXE8+8VM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=brtq56IBhAXElmGaycni4LUi0RyvHLoyc0vjPmraGAgCMhUkbjL/+cTGR1EowZUYa9wLcMRK1lToIjB8QFBXGHLW4xcIddb6hF8nuHvhFXql3sTrgMoT5094gRWw6LnLVTMZ2GDy6nwTLxWJWfaoKeZUuODuMZr8d58OoE/8wQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WD8m9HTk; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WD8m9HTk"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8686f46e4adso1374300b3a.0
        for <brcm80211@lists.linux.dev>; Sun, 13 Sep 2026 09:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789318540; x=1789923340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oelscxdULKd6qFzcXaquUXe47LCs3+b2gZyjgR6VSFA=;
        b=WD8m9HTkdhxkr8NyGCWIBAyPWsFaLCpDlHXfFTCbohCDrqveXpPgYS1s2ekXXI97PI
         Dr9sRqdiGXJM0gX5K16efhJ+G+Poq3X6STzIrAL6elEdDe1wIYOM3CgWHy7d4VWJwURz
         UzVK5AqMCYRyu/Rh+DgzDd3aOEypVGYB+lGbgEV5sJaP4OZDLs2BakS9237j1zAsZ3MR
         fW8k/w8i0Iks5crDxbihaFGbOsLiHOrmXcnUaUznpuLdc8Ooc+bi44ynHUfSoWYs52uC
         FgnQn1X1sIK2FeKCRimI6bOl6DcTWxSyTaJ7G8m41/3BjUIbAHCRbG+8T1xEh0IZDIjx
         7hhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789318540; x=1789923340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oelscxdULKd6qFzcXaquUXe47LCs3+b2gZyjgR6VSFA=;
        b=UEXUqe5fWSYrs7Em/ydtUvVPL90J80mfSeqD/IFmL0ujgoQNW5fX1z5oypP/RlKfd6
         KrXQh+iJwsqdjTRPDUFmyViB9FTvyyJGzwmHqn/n7wuL/2BuXLIm+HZo/8ZWKYOTT7hv
         2VLk1T8z4oHRQtdnkDg3U27HOuPCxaOqOCmy0P1jzVQ/U2YyJsa4HAV+msSqFjrKNq4k
         hjYMjbN8EC2iILimFhcDbnzsjqrt+qqj19wCeCzmu1CFktIqaTL96IZ+nFfdnpfwu1MR
         97bZqN7VO0H3w4anB0s5IKV1cuZYM5gTqu+S+mZ3Uy/gPS5aiEbrcQAkOEppaJ7dT9C0
         HyVw==
X-Forwarded-Encrypted: i=1; AKwUvByzpPHUz6sWcWOa/Qjex7MJao4zIy3M9xRakQ9eueAIV8A8SDNCCO/iVLMih1da2L9Xo98/HlXL1us=@lists.linux.dev
X-Gm-Message-State: AFuF++msUdx0B1eoS3o9aHnXWGMNjmCsXSzPk0Eefv6WwzJptwIO8pGA
	4YsJ2DYduosIFyPvPhoa+QYQTXa3vjhF9fzwY+1PV1kD07RoQud/n9Pu
X-Gm-Gg: AYBFou2zMGTRlf2ugGoScU4W1HWxP6cQusR05rW9az9T8dnizkB0I6yy3o2gOhX2dHC
	O7wRJoWXXQ1NUZf81Ee8wGA5dj+8dXDens6FruoUZovTcay301zJtjNPW3o1uM6M9Ym5eV4OSy9
	5PJJfYBg0O7byFbbhBp3SRQqHlg0Iy7xpPbDrvl+QzKXj0B/Fb2edMw5A/1+kJ9hEsiOIcdkrr9
	wZgwkoRVyrZsOZFNUHwSgUSPyOK9g3e7ZvXonm5TL98CaLEt6B4gID3ttz0p9Wrd6O0xWhYNrGD
	srlxrgE1rLHlsBUXujDnGpS3lg9LxYgaqzEU/6uqz3paztUOfr3Hnb8nAJkYKFB5yPm4guYhK5i
	8z1QUO47J+zUItYXhBl3Tas23syuMgbe+bO+e374aRS0K6p2lCGtDAFKaESyoYBv9cpouilisv0
	2k4dppdiyn2WJaVOIO6p6M0mYt6EVStrgWWNdq1QPiyGQ5emydaXXmtqR8B65JPrHJLYSOu1VIB
	H40VPHQH+678T5lDCKr+nMEAvJoIlFYlZ6KBqxPDas4WzvadU/a0aGri5x0p+RnrA==
X-Received: by 2002:a05:6a00:3a26:b0:868:9662:5137 with SMTP id d2e1a72fcca58-86b31907b6fmr20978554b3a.11.1789318539994;
        Sun, 13 Sep 2026 09:55:39 -0700 (PDT)
Received: from localhost.localdomain (59-168-175-18.rev.home.ne.jp. [59.168.175.18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a7c7395sm3412760b3a.61.2026.09.13.09.55.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 09:55:39 -0700 (PDT)
From: Ryohei Hashimoto <laurel.medalist12@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v3] wifi: brcmfmac: log the firmware status when a connect fails
Date: Mon, 14 Sep 2026 01:55:26 +0900
Message-ID: <20260913165526.4426-1-laurel.medalist12@gmail.com>
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

Assisted-by: Claude:claude-opus-5
Signed-off-by: Ryohei Hashimoto <laurel.medalist12@gmail.com>
---
v3:
  - add the Assisted-by tag required by
    Documentation/process/coding-assistants.rst.  It was missing from v1
    and v2; sorry for the omission.

Tooling, as asked for by Documentation/process/generated-content.rst: an
LLM was used throughout.  It read the driver, proposed the change, and
drafted this changelog.  The starting point was my own problem - a
Raspberry Pi in a car that logs status_code=16 on every failed connect -
and every claim above was checked against the source before being written
down: that brcmf_is_nonetwork() reads @status, that brcmf_is_linkdown()
reads @event_code and @flags, that bphy_err() is behind net_ratelimit()
while brcmf_info() is not, and that bphy_err() is what the rest of
cfg80211.c uses.  No specialized analysis tool (coccinelle, sparse and
the like) was involved.

Testing: built against mainline (2f0c1cf72, 2026-09-12) for arm64 with
W=1; cfg80211.o compiles with no new warnings, and checkpatch.pl
--strict reports no issues.  Not tested on hardware: the affected device
has a read-only root and lives in a car, so building a module on it is
impractical and I have not observed the new line firing.

v2: https://lore.kernel.org/linux-wireless/20260909080603.2955-1-laurel.medalist12@gmail.com/
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
