Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2594442FD8
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 16:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514014; cv=none; b=Mxx+DiLF9MN0ZuU2/3cUs8XJDfmTp6Sf3P6J07ygexLPvrapjYQohPe+MqNXQcR6evSMZnBS3UNAOG29vOnKlfgyhBR5Rx1jVScJDNK/tWzq1cSwRaFlcY19tu4fk9/wAE0nM9xkz7qCSB4BewDluhWy6q/LEDQuFAE3NXEhmwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514014; c=relaxed/simple;
	bh=/N8ljrUbwx9dQ+KpsMf15ufKltiMDwixZdIQ7x2jW64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZrdByAGkfIXP8RB2anPsyZ0plfksEmCt8o6fjoj74OI/mHopiUK3VhO+YH25lOvsBDPj/Aha+IV5XhE/1oq2TkmipeKpS0/yS3OpGgjh01Cg6P1eCH0b6Ne6twg99r+K0joZJntF9A9n5b+AhKpDIYhClh8g+kp/xTRqW8NOzA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxpMLv5B; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxpMLv5B"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca6a6181273so76098a12.1
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 09:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785514012; x=1786118812; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9C9LjO0hSvCIo11gUDBsB2QDOOiAgSqeU46qfcd4pH0=;
        b=KxpMLv5BeKe/Oipg0AvGupKSRKBfXD+mA8IU0FV9Io4MRvlIQ0mS13PRdb147yJUYH
         fHTOM9pFAF6+Wm3TxbUgt16LQUCopbOnAv+KoqoChCrYaVSP8m/lwmj9bxSv3I6m5/7K
         PDdMfoFQ5fMyzMZE8Jlq8NLxN+MeSgKkVuC2FpZPCwGK7SV03vkOqC2IWw2dx8+JTfwM
         kPwIqdeyJNWppyZC98qBljAutCOKfZpIobyUziIVRYdHkCvxw7Ss0VBB2UvnXkFnP/yf
         mRtRtwMSRh0nfel6qpj/U14r9Cz1JUyfueLM9MGcayqlshVli4Z9hv9zemfrPgrCO8dV
         8WKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785514012; x=1786118812;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9C9LjO0hSvCIo11gUDBsB2QDOOiAgSqeU46qfcd4pH0=;
        b=VAAaVKmIebgOMECeAPyeKSWmM0Qc81D292LCvB9K9ioyi3aND+GQDX8UvlCShEsVFb
         u4BqoVFkCedcgK9yiFTva8udvRBgf7f5SSvSFk4vOTlh+JysuYnldwlhj4G/GkoyZ9nM
         SW98Zw5yXbT1FUPycA1lrN9seQ8kwX7PchT+H5C2ZoO8wxbt0tHC7WMQbZa4txdviggZ
         LZg1KLvV8pOBIL12EgGrc803bRBejnWgX6iWOLjwtk+m4wldvLoLg2guDTxveQKGldn0
         j4v+FQEdRkhX0dSXbHrQ/qlI4yOx7RTDAPSK4euVnqAwliwy/rLm+pw09Li78j2EjO7k
         HCWw==
X-Forwarded-Encrypted: i=1; AHgh+Ron54iwEgKuJ7nF+ouSy++QDIw4EDHZe1SB9upgRCxYVFc1XsZn9zT8FzjMpagvc3/pkkBkd56aOBA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsysEal5dDud8IGvaDzETyosm4iA7VmS77H6LG2NJdHsdN5tCg
	urYDhj5sUDF+n9BvV6MVjcAGILjJ/oNfoUgM/vl9fR4Vo1o+vQ293+Vs
X-Gm-Gg: AR+sD10fTVNlylm4ktsgXRH2XEmDlZmjd9sexO6i9b9lgf/LQNE+qZRDqhz6WUx5A2p
	5lTmt894YW7CxqwWfC0DsL5BM/bsvU5xotlKqkc784A78gG8VG2PM4SWonX8568fp2k5awYRYYG
	lmmKn+yxlS1t8CBwmd9MYBcmMkdQBiuRe4jvrPGVhN8dZ7tdvt4UanJMigOG3Hd2ESMeEKymGkp
	XTBThPEJsSzxujM/kSP4DtHe5F41qmqPFsZDlVUKH+PkNvoAHQVTYWGAdi5yxVLrSK4nE9cxfCE
	Iwcn8pCkQamv6tvHdkVPvCEdSqldBAYvRatst/y9Ku3Wj45PLSPBosvus2onK0/Q7jtI9u/Jtcu
	BhSm/TamWcjfbXJ+QSAtfd+SGKe2wRMy5mPQFyEeTq072/3SWsFtX+bnZcpCDBCIpLZMe/Cw/Xm
	BhgLAd4GDgZgrqWWM61JRbN5Q5ojCK4Hg8wNEifcr1O5VR3mbwkZZ5+eluEWxZTxVR8fZB4AA8K
	XJDdStH
X-Received: by 2002:a17:903:46cf:b0:2ca:ecf6:9115 with SMTP id d9443c01a7336-2d0523bcf3amr7876085ad.2.1785514011865;
        Fri, 31 Jul 2026 09:06:51 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm7881425eec.8.2026.07.31.09.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:06:51 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v4 0/8] wifi: brcm80211: performance and stability fixes
Date: Fri, 31 Jul 2026 16:06:17 +0000
Message-ID: <20260731160646.3812-1-chanelshivesh@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes several performance bottlenecks and correctness
issues in both brcmfmac (PCIe/SDIO) and brcmsmac drivers.

Changes since v3:
 - cfg80211.c: Removed spurious double blank line flagged by
   checkpatch --strict.
 - All commit messages rewritten to follow kernel standards:
   explain the problem symptom first, then the solution, add
   Fixes: tags where applicable, wrap lines at 72 chars.
 - pcie.c: Added Fixes: tag referencing the original PCIe commit.

Changes since v2:
 - core.c: Add skb_cow_head() before skb_push() to prevent a
   kernel panic when skb arrives with zero headroom.
 - cfg80211.c: Fix PMKID V2 shadow counter corruption bug.

Changes since v1:
 - Correct author and Signed-off-by to chanelshivesh@gmail.com.

Patch overview:
 1/8 flowring: Replace O(N) blocked-ring scan with atomic counter.
 2/8 sdio: Coalesce N+1 sdio_claim_host() pairs in rxglom path.
 3/8 core: Fix skb_push() panic; populate radiotap RSSI field.
 4/8 cfg80211: Implement PMKID_V2; fix shadow counter overwrite;
     replace mdelay() with usleep_range().
 5/8 msgbuf: Fix silent TX stall; increase NR_TX_PKTIDS to 4096.
 6/8 pcie: Replace msleep() with usleep_range() + backoff.
 7/8 fwsignal: Document safe no-op for duplicate MAC handle ADD.
 8/8 brcmsmac/ampdu: Reference IEEE 802.11n TID requirement.

Shivesh (8):
  wifi: brcmfmac: flowring: replace O(N) blocked-ring scan with atomic
    counter
  wifi: brcmfmac: sdio: coalesce sdio_claim_host calls in rxglom path
  wifi: brcmfmac: core: fix missing headroom check and populate radiotap
    RSSI
  wifi: brcmfmac: cfg80211: implement PMKID_V2 and fix brcmf_delay
    busy-wait
  wifi: brcmfmac: msgbuf: fix TX stall and tune buffer/threshold
    constants
  wifi: brcmfmac: pcie: replace msleep polling with usleep_range and
    backoff
  wifi: brcmfmac: fwsignal: document safe no-op for duplicate MAC handle
    ADD
  wifi: brcmsmac: ampdu: document IEEE 802.11n TID requirement

 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 122 ++++++++++++++++--
 .../broadcom/brcm80211/brcmfmac/cfg80211.h    |   4 +-
 .../broadcom/brcm80211/brcmfmac/core.c        |  44 ++++---
 .../broadcom/brcm80211/brcmfmac/flowring.c    |  65 +++++++---
 .../broadcom/brcm80211/brcmfmac/flowring.h    |  18 +++
 .../broadcom/brcm80211/brcmfmac/fwsignal.c    |   4 +-
 .../broadcom/brcm80211/brcmfmac/msgbuf.c      |  69 ++++++++--
 .../broadcom/brcm80211/brcmfmac/pcie.c        |  66 ++++++++--
 .../broadcom/brcm80211/brcmfmac/sdio.c        |  62 +++++----
 .../broadcom/brcm80211/brcmsmac/ampdu.c       |  11 +-
 10 files changed, 374 insertions(+), 91 deletions(-)


base-commit: 5e0bcb4920bcb9e0ef6c03a91730fe45f643f3a4
-- 
2.53.0

