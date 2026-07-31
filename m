Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88D138C2D8
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 12:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501321; cv=none; b=hDRmumrX443cY24aLk16Xh8HycNfiNE/NUekf2/fHnnvkzooDjLj07h8bDL9fX5JpWuQjb67ECWQVki2JuLujcW4zS8TR4w1bnw4FV1Z+w2KPEGXrqmz3QX/hubOBosPNMFi6KLvUxDT/KkJwIhYENYr8ev7nEF1kVztRm3X0pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501321; c=relaxed/simple;
	bh=cfKdCorObDXh8PC5irfro8erof3/7//TVTmt7cxD2M8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jPDnxL7qhydvRHqrfVzUJ8DrYi2gfFaLIE8oniMyGBLit8R6u/sIjrOqyltsuPZJITCwIDNndpe1rCZEQ6zNS0jyhQi4W/cawmwtjzcN4xquG0DmAgjASpDKQYd2NGnF+6ZuF0RvO2ksjJszcMJkwOKi48hncckXcH8bQoU49dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=gfUIMPqw; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="gfUIMPqw"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-381b831d535so1070847a91.0
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501319; x=1786106119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4f43KRrFa0muuSbKDdNXaRcP3kRyxwahtJOXk0KGM2Y=;
        b=qM2jig8dFOufvJLipqFlhpqGsaimE20CmfrrK0biDpbJ485wcurk5X4cB1+3VzIo17
         wqJfogl3cHwf/Jh7kZX6xXxwYjxPAK75Y4gkJQuM+Iy0ckopYcklOwcx8BHVtATqtUya
         6H0es25amUvEWQ6QgDtus7mblACuomUZVfKtncLpz3uwvKkI4H9Es93qqMRjI5u/RSD4
         ef257ePmtNfxYsaIXf4zT7OZOhJDQp8UtTXxQTrJxMbnLAMt0QE9Jo5LoE4y8Xw7v4oo
         xtD2kM5TQUrVeRQMZ8C2ekU6stjFdJA41KrpSyzflr4unhCgyIdkukbHt1nI80hn990c
         T7GA==
X-Forwarded-Encrypted: i=1; AHgh+RplBSVLKDQIwIpfOoD80KjuPFpahEgpgMooOuAjCXd5uWiQ640gvFodtEXUS9QTQtxG3SX9sijZT4I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHeY5CVOTeM996mEMzpo+p+i6LdR/eMkJCXl2R3wT39/T7lc53
	xN0/WR0StIU0vPkHJm2hhXe96HLB70wh2WIbmV2k5Q6+CKSYevvDxRZO0owsvKu9n+ImiFYrdUM
	plmBotPe6H+6Mpd7d5tQvVk4DBOtXPAwAg94cminNDPgi2UpEdB7JXDg4M984IRA/rIqrKrnEWA
	jj198Wjack/zgNltXlv1ZODYSkhYykjZSej40zseAcmDam7Joi6nA77dfI/vfxomkzlFy51Tuq1
	KgXTjjwuT2JdORzKdZPPg==
X-Gm-Gg: AR+sD10oxxI94Dhqv5SYAVf4tjQAQLON47UjEvngDvYYCZVtwSGhrNn1pIjFHRwc8mv
	pDLwuSu32D1b9CYJ5vfpXMQT3EuAlodTR3x0cwpE2pvz5+vBaj30IcMLxJK7rE2fEhGVCWbd3ED
	4KzHEkE7tq5QpHSj+eLTVJz6kWuulp7Q7f5FKOKf0t/3vIZALT2l+fWhqql4Wu/lusBAryBVfSm
	4XO030F1EUlh19fGYEEhyZMa5Kwp1LAfIt3XE66znUrCQDAHTsxLjIgi/WajEBZj1RbsoX+yddD
	XrYKCnRkxXQFELlnymDkE00Hg6qdv8VKOyjiHxp3WkI7CEHgUmu1adqJuEbyE/V6cMeApbUyYHU
	RME3VZ1tMPPHSwv9zfOmHW3d2jtKyKap1QQwaEkDInzzbh2UtQE3+DLnXtpe5Su+daBV6yGY6QA
	eeJ9G3mkhi9ilFwfW3D6OQhPazwuObBkGKBJKuHJY=
X-Received: by 2002:a17:90b:3b85:b0:38e:69b5:5386 with SMTP id 98e67ed59e1d1-38fb13b66b5mr1931412a91.33.1785501319176;
        Fri, 31 Jul 2026 05:35:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-38fb2b262b5sm5279a91.3.2026.07.31.05.35.18
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2026 05:35:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2caf4173b1cso17314785ad.3
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785501317; x=1786106117; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4f43KRrFa0muuSbKDdNXaRcP3kRyxwahtJOXk0KGM2Y=;
        b=gfUIMPqwfc/28gXn5iApk/YC1H/jO2Shqd3Kl2l4mwdrxCfY3XPVOX0OzTCu9MfFyr
         s37KRb0w7Ttxp3sM6RAlMz/6xYbHed20i8YUdWUusfgVSMXZpQBHPRIVrgSvfaOOBsq4
         SHlkhsl2JDYSMlaWXd5v2lcNM30E3cLqeEMVc=
X-Forwarded-Encrypted: i=1; AHgh+Rq9XuUk9Mtq3/Q61xjvqVgyOx2NhG4GYG3qvKx97+onQwgMeBZ2WPE/AMZp8h+76dJE8e4l9/SBzHs=@lists.linux.dev
X-Received: by 2002:a05:6300:2288:b0:3b3:223f:d3fc with SMTP id adf61e73a8af0-3c91b363d27mr1712710637.45.1785501317151;
        Fri, 31 Jul 2026 05:35:17 -0700 (PDT)
X-Received: by 2002:a05:6300:2288:b0:3b3:223f:d3fc with SMTP id adf61e73a8af0-3c91b363d27mr1712686637.45.1785501316697;
        Fri, 31 Jul 2026 05:35:16 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9be04sm5187041eec.9.2026.07.31.05.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:35:16 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v3 00/13] wifi: cfg80211: consolidate cookie assignment for async ops
Date: Fri, 31 Jul 2026 14:34:56 +0200
Message-ID: <20260731123509.1975281-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

NL80211_ATTR_COOKIE is a userspace-visible u64 that correlates an async
nl80211 operation with its completion event. Three cfg80211 ops currently
delegate cookie generation to the driver: remain_on_channel, mgmt_tx, and
probe_peer. This produces inconsistent strategies across drivers: some use
an incrementing counter, some use get_random_u32(), some use a CID cast to
u64, and brcmfmac's mgmt_tx always assigned zero - which is arguably broken
since cfg80211 treats zero as an invalid cookie.

The add_nan_func op already does this calling cfg80211_assign_cookie()
before invoking the driver, ensuring a unique non-zero value without
any driver involvement. This series applies the same pattern to
remain_on_channel, mgmt_tx, probe_peer, and tx_control_port.

Structure
---------

Patch 1 does the cookie pre-assignment in the nl80211 command handlers
calling into the drivers. Drivers may still overwrite the value at this point;
subsequent patches remove the per-driver generation. Patch 2 updates mac80211,
which has its own internal cookie counter (roc_cookie_counter) that becomes
redundant. Patches 3-9 are per-driver cleanups. Patch 10 finalises the
interface by converting the u64 *cookie output parameter to a u64 cookie
input parameter, making the direction of data flow explicit. tx_control_port
is handled separately in patch 11 introducing the zero cookie value used for
the dont_wait_for_ack option. Patch 12 avoids sending frame tx status event
when a zero cookie is passed in the frame tx status calls for mgmt_tx and
tx_control_port.

Non-obvious aspects
-------------------

ath6kl (patch 3): when the destination STA is in power-save mode, ath6kl
queues the management frame in a software queue (struct ath6kl_mgmt_buff).
The cookie must survive enqueue and dequeue so that cfg80211_mgmt_tx_status()
is called with the correct value after the frame is eventually transmitted.
This means the cookie field is threaded through ath6kl_mgmt_powersave_ap()
and into the queue entry. The vif->last_roc_id and last_cancel_roc_id fields
are widened from u32 to u64 to hold the full 64-bit cookie.

Synchronous mgmt_tx (brcmfmac, wil6210): these drivers call
cfg80211_mgmt_tx_status() before the mgmt_tx callback returns. The status
event is therefore sent to userspace before the nl80211 command reply that
carries the cookie. Userspace must buffer the status event and match it
once the reply arrives. The pre-assigned cookie being consistent across both
the status event and the reply is what makes that correlation possible.
Previously brcmfmac passed cookie=0 to cfg80211_mgmt_tx_status(), which was
broken; this series fixes that as a side effect.

qtnfmac (patch 9): the qlink firmware protocol has no frame-TX-status event
type. qtnfmac never calls cfg80211_mgmt_tx_status(). The previous code
generated a random u32 short_cookie and sent it to firmware purely as a
debug identifier; it was never used for nl80211 cookie correlation. After
this series qtnfmac simply uses the pre-assigned cookie for the same debug
purpose and discards it. The absence of tx status reporting for the
wait_for_ack case is a pre-existing driver limitation not addressed here.

mac80211 0xffffffff removal (patch 2): the old code assigned *cookie =
0xffffffff for the dont_wait_for_ack + need_offchan case to ensure
roc->mgmt_tx_cookie was non-zero, which distinguishes a mgmt-tx ROC from a
regular remain-on-channel ROC internally. That dummy value is no longer
needed because cfg80211_assign_cookie() guarantees a non-zero result (it
warns and skips zero if the counter wraps). The cookie is still not sent to
userspace in the dont_wait_for_ack case.

Changelog:
  v2:
    - SoB for patch 1.
    - zero cookie usage in tx_control_port (patch 11).
    - drop frame tx status event for zero cookie (patch 12).
  v3:
    - deal with rtl8723bs staging driver as well (patch 10)

Arend van Spriel (10):
  wifi: cfg80211: pre-assign cookie for remain_on_channel, mgmt_tx,
    probe_peer and tx_control_port
  wifi: mac80211: stop using ieee80211_mgmt_tx_cookie()
  wifi: ath6kl: use pre-assigned cookie for remain_on_channel and
    mgmt_tx
  wifi: wil6210: use pre-assigned cookie for remain_on_channel, mgmt_tx
    and probe_peer
  wifi: brcmfmac: use pre-assigned cookie for remain_on_channel and
    mgmt_tx
  wifi: mwifiex: use pre-assigned cookie for remain_on_channel and
    mgmt_tx
  wifi: wilc1000: use pre-assigned cookie for remain_on_channel and
    mgmt_tx
  wifi: nxpwifi: use pre-assigned cookie for remain_on_channel and
    mgmt_tx
  wifi: qtnfmac: use pre-assigned cookie for mgmt_tx
  wifi: rtl8723bs: use pre-assigned cookie for mgmt_tx
  wifi: cfg80211: convert cookie output to input parameter
  wifi: cfg80211: convert tx_control_port cookie to input parameter
  wifi: nl80211: send frame tx status event only for non-zero cookie

 drivers/net/wireless/ath/ath6kl/cfg80211.c    | 22 +++++--------
 drivers/net/wireless/ath/ath6kl/core.h        |  5 +--
 drivers/net/wireless/ath/ath6kl/main.c        |  1 +
 drivers/net/wireless/ath/ath6kl/txrx.c        |  1 +
 drivers/net/wireless/ath/ath6kl/wmi.c         |  2 +-
 drivers/net/wireless/ath/ath6kl/wmi.h         |  1 +
 drivers/net/wireless/ath/wil6210/cfg80211.c   | 12 +++----
 drivers/net/wireless/ath/wil6210/debugfs.c    |  2 +-
 drivers/net/wireless/ath/wil6210/p2p.c        |  6 ++--
 drivers/net/wireless/ath/wil6210/wil6210.h    |  4 +--
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 12 +++----
 .../broadcom/brcm80211/brcmfmac/cfg80211.h    |  2 +-
 .../broadcom/brcm80211/brcmfmac/cyw/core.c    |  8 ++---
 .../broadcom/brcm80211/brcmfmac/p2p.c         | 10 +++---
 .../broadcom/brcm80211/brcmfmac/p2p.h         |  2 +-
 .../net/wireless/marvell/mwifiex/cfg80211.c   | 20 ++++++------
 .../wireless/microchip/wilc1000/cfg80211.c    | 19 ++++--------
 drivers/net/wireless/nxp/nxpwifi/cfg80211.c   | 20 ++++++------
 .../net/wireless/quantenna/qtnfmac/cfg80211.c |  4 +--
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  7 ++---
 include/net/cfg80211.h                        | 14 +++++----
 net/mac80211/cfg.c                            | 18 ++---------
 net/mac80211/ieee80211_i.h                    | 11 +++----
 net/mac80211/offchannel.c                     | 27 ++++++----------
 net/mac80211/tdls.c                           |  2 +-
 net/mac80211/tx.c                             | 31 +++++++++----------
 net/wireless/core.h                           |  2 +-
 net/wireless/mlme.c                           |  2 +-
 net/wireless/nl80211.c                        | 18 ++++++++---
 net/wireless/rdev-ops.h                       | 16 +++++-----
 30 files changed, 128 insertions(+), 173 deletions(-)


base-commit: 4a0bd262df757b25fc4e2a53c947317c119ced4e
-- 
2.54.0

