Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FFF344D83
	for <brcm80211@lists.linux.dev>; Mon,  3 Aug 2026 09:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785749725; cv=none; b=jNvFD/pmbBnxgr8gwldVmaIeFtaswOtvOriGd2khS7qsTevRlY6H8l/wb/xU207oun2shL4mhZstI69Tc2nS2ZOkarFbCjtN3ArEMGENqSnwu4zeyr4nqpw4XWZUvzNRsvcdlacM2GtZW3OV+30Nxxz891QcRB2ULpfi9STEAqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785749725; c=relaxed/simple;
	bh=DoBL7Qly3tk+RGTMaFUJMUuVsP34uQLJMhuVsoEjrbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KtiCV3e7pJF5qaqvQ/nArRtVJwvi4SKeAjU96CSNlAWBBS4zZKqc7Cq6XlGQxW2p2wngCa5B/uu2/HgA/Qe8Te6Jcbb17wgU1M2ZbVd9k6Bxm4F1a+5/eL74oLMnMqipBq2UKL9ELEgoiJlYDYV1CHEISAmMyFaYhHwtthA9KuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=OIv87jSM; arc=none smtp.client-ip=209.85.210.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="OIv87jSM"
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-84e27035206so3467189b3a.3
        for <brcm80211@lists.linux.dev>; Mon, 03 Aug 2026 02:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785749717; x=1786354517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EE8QIzp2YaXHpPmzLAzL2tRMNu4U4ZZi0jVVWshr8xY=;
        b=gDZUYx39VKqV+b4hlQzH3r7WLwEldRT07vMoJCtEqG90SdJzv5Nik3EaofMO3mCHyh
         0JHrDvjTYiF7/2jvC6WdfL7Zg0HuryJhTOKxHpDR8KLoum5uCtJs220cpKya+DAPQQeY
         6+Riyebm2MrSpJTk9jgLogLU0Cbux4TcwrvKGvwxEeI+4rySneZeb01sjB0hzSvuU0ci
         pcOwH6uHe1sQ6jfPAn7AGBpxBhZ4/aezTlcXXI8kUDpiYmCO9m1xNKYZaR0VZE6KA7Ee
         N+oKr+3gi06bXapRejt8FmsP19h4G/6jrtUwM3HOpI2egG1OqQCkCIum7oIzumNCSCJS
         mLqA==
X-Forwarded-Encrypted: i=1; AHgh+RrqNaUC1TX7yrhk6ac/vMj99IFwhmXtx8kQzsEZpVgEilSoQivdvI/9ohbKNZbNFIiQukyVUq8TbKA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyByxBHweJep68pCdzr4Q6pkXmwTUBfPNYSIEe2iy56WUYxRrs2
	EJr2uufKb8Bl2IIsnEgnJMP4LC0o9CNiEadX3jfTbOf0rTi3LcoKV49GLLrNJNqRg8SNOmnByLb
	giS8VhEWlFk0higxp66uwqaoVoJWF+Mi85fKFA3j3jR461FipRMCffTab91ZH8ZA4KD4EnlrziM
	z/MrLjE3f+KwQ2/P/CkKMiJr+WFejNWc5yPL/Ng5jl5iQjY1NpP+lc3FcCa5QJle9WJIEEF7yzj
	lQiGPLu6vzBAPk8H4I=
X-Gm-Gg: AR+sD10FKqtojMpATXIo0wCivH4LkgXTuzTMDlgRVlEx8xyUAkL0QQ09LP+ElXUi1t4
	KdO2BLCgo7/waz+rW+vuPq6vHWvsByf/ORT84nTFi6Tj00jcEKQgRBFHaGDaDgBWJ2jw/gVg/B5
	n9lC9I/6Ud7b5DR/Hv6+cOWPeuekHxS7vVSCq79eJy2u8Q8z3QAzqEjzousoDWlOmkBVzXFKCYP
	8fOSawIUZTS08jPGuKfzyyOdoGgib6fidMv54mm55TdPifSp+iW5qEhcK3cD8u2ZGBqLeqPc/NX
	TwsnA+uxvXaOuK0D2Jw1vQmfSCtJCE1HHu+vgJeC7j3atxkqblVayn3bG+YCrw7C1JwVkfzwoPs
	Y8t4Bs2L35FUg8ipZ1acifj05b0OVZCRL7w7N94gaG8WpzmM4lcpgdOb+tRTa6QHwYZuwA09Khs
	R7Jlqn+l6jB15pHyHnFT8qdTcWRYREMwvIc+8Ul/o=
X-Received: by 2002:a05:6a20:a11e:b0:3bf:5b7a:fc8b with SMTP id adf61e73a8af0-3c92a25e0fcmr9088566637.0.1785749717479;
        Mon, 03 Aug 2026 02:35:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-3153e2ae9d6sm667384eec.27.2026.08.03.02.35.16
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Aug 2026 02:35:17 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab041eced3so5112108a12.1
        for <brcm80211@lists.linux.dev>; Mon, 03 Aug 2026 02:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785749715; x=1786354515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EE8QIzp2YaXHpPmzLAzL2tRMNu4U4ZZi0jVVWshr8xY=;
        b=OIv87jSMD1OdlvKCiVVZS8O7clu6Rvwj2Kx5577Rz79S5cuq3mTL1Rk0yQgRUCmmtl
         FhXy5jB3HM6OAI5xZbDnd3I9hLxF+pF9st0f3gdxc1jFhtxhenW6sY05ZGdWMWLk8Yj+
         qxOULfybmzbD7btO/BtzdVKLc4QuPeG1zVBcw=
X-Forwarded-Encrypted: i=1; AHgh+RqjAq+fRRKeILhZAqzxQjDcLOWZ/SJmKU3Oq7Y9DANeE03qtMhDHPZQDDDNcHZPTk5Thp564rvX7Y4=@lists.linux.dev
X-Received: by 2002:a05:6a21:3390:b0:3c4:3ada:384d with SMTP id adf61e73a8af0-3c92a57baf2mr8170850637.30.1785749715413;
        Mon, 03 Aug 2026 02:35:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:3390:b0:3c4:3ada:384d with SMTP id adf61e73a8af0-3c92a57baf2mr8170813637.30.1785749714734;
        Mon, 03 Aug 2026 02:35:14 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab2530c0sm29343644c88.8.2026.08.03.02.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:35:14 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	stable@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH wireless-next] wifi: brcmfmac: Fix memory leak in brcmf_sdio_read_control()
Date: Mon,  3 Aug 2026 11:35:06 +0200
Message-ID: <20260803093506.1647790-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Abdun Nihaal <nihaal@cse.iitm.ac.in>

The memory allocated for buf is not freed in some of the error paths in
brcmf_sdio_read_control(). Fix that by adding vfree() calls.

Cc: stable@vger.kernel.org
Fixes: dd43a01c5cdb ("brcmfmac: use dynamically allocated control frame buffer")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
[arend: rework as suggested by Johannes]
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
index 9f7ed1d293a0..381801af3ac9 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
@@ -1827,17 +1827,18 @@ brcmf_sdio_read_control(struct brcmf_sdio *bus, u8 *hdr, uint len, uint doff)
 	if (bus->rxctl) {
 		brcmf_err("last control frame is being processed.\n");
 		spin_unlock_bh(&bus->rxctl_lock);
-		vfree(buf);
 		goto done;
 	}
 	bus->rxctl = buf + doff;
 	bus->rxctl_orig = buf;
 	bus->rxlen = len - doff;
 	spin_unlock_bh(&bus->rxctl_lock);
+	buf = NULL;
 
 done:
 	/* Awake any waiters */
 	brcmf_sdio_dcmd_resp_wake(bus);
+	vfree(buf);
 }
 
 /* Pad read to blocksize for efficiency */

base-commit: 4a0bd262df757b25fc4e2a53c947317c119ced4e
-- 
2.54.0

