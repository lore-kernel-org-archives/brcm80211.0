Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BE5440A2F
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 15:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512953; cv=none; b=c7NzwG4OYgTj9aFvaN4G8aG6JXpIpANSnwqYbrYCxNS+As0uaWiPYAXQpnXS2NY3PmRHRrq9W23l1UTX+k6RuGrUwCqM8TpX5LnpHVUTXc1kQ2LAnuBkh1RDtXlsPQxK1Qst5KQEHRDXFHFrdT5NfWMjFcH+SDTol1AVQLXtjS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512953; c=relaxed/simple;
	bh=PERNb1guRI8ZCQ12dy0SrLJzSrN4b5PB+j5i+IenUQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WIKtow4OuD8hVSYpx2UsemQhQg2z6xqH3eMhWFqtBoe/OKfq9Ox51xAjVmD8RCZaLG9RDBiadrrtKjTgzFXPDTtSL+QWhYuLcbJQ+7sSyQ6l1swNo6e3xqBS75MdfiE44I74H1qxLoOTCCX740kwavYL+gJVFZXrfSUVhGr8U2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmPy0ePL; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmPy0ePL"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cad85b7b5aso1020715ad.1
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 08:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785512951; x=1786117751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CZlO6ryQTGpm3SzZQm5FnSP1XcX7Y/GaBhxwcLiVUTU=;
        b=GmPy0ePLKFCngP4j15uwvc4N6oTeGxf5RgIBcCEgJcW+9uRZzEei4IHHW37qB/ezLc
         qkWE9e/oDI7vMsy35t2yyArev6fGQDYy/lQSQsGVZfEwjYeQZ3jl6qA+68BWnSHrkI2V
         p6+IrIC19KYPwU0765JUyEvluDO1PJuC2aC7OWHKtD2d+hGMs1AROmMpxY2pt/KXvkSL
         AeVl96QDHP6E6QOMActur7J3FquYSVFi/EbyJ7Crv1lERlJpuJykyF/9CC4nVDdkM/ah
         rflbTu7suVw49jvw8t4bNLf3ynuOJ40K/y3V5OJPtkGd1XqKmVlirUN3hGQc+1DAXzN3
         Dfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512951; x=1786117751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZlO6ryQTGpm3SzZQm5FnSP1XcX7Y/GaBhxwcLiVUTU=;
        b=f+1PBXD0KeLbnNlYcNWNd5cF19upkFPmP06JJdJCL1VIjKNfUR+qNwNqnQZlMSiw/T
         Dp51FMm3OX04mG37nj6f3IVYvciOKB6GeH9gWVtH4gou/OC53H+OHCHSat6lZH5y+VXE
         bevf3h7IkVCtIc9S0XazMbYc+zHxdP+BaI1yf22Tap9dd+1qy5jwXmCvCO/bK3xDoyAS
         59Ba7ZE+9QUcv4G13qQD0RvdVmeKkNXGoEcm4i1pfKCmZp9dcHcwdT0D8DamNUqgz206
         +5QJvHio0lLC2plRfxNzJyZHG3HvEGVAfEn8nsXu0iOoYDmjQfXAYbhr3gYornQv+RLb
         DyjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNYJrWbudZN+jgKuZAw/XuZjB71s7yaW1lR96cDgMx9imdn2Q+sgTRvDck84Wu8LtFV9XiLnPCx4k=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLoD70W30av76DT3htFpV3dV76Bb0wqu/ab+LskZRSMnieH1u8
	0GyKTr8ssfrNzsd0zNjs3/bEMXGuqrUi+jnfsM02O4K2UYUorA9wuMzk
X-Gm-Gg: AR+sD13fo7jZCqTb07u4lSpCpL14K8NkN3qMwcEcIJ0uiRhF98JD4vOWVEuTWK0/o1t
	Tpz/MyidqFYY1GIblkT8PMVld7QFyzPVabQagWvmkLRx6nR2M7LHeYR6ESqG+TZtNf21jpWon/i
	Nt5bByGd12agp2WPDp74DtdZvbCNrd73U4bd7Y5s7AAz5CrjAs9JCUJIzOaKmo0Fss6jN9dy8n5
	h5WeED0jY1XEdPJE6ARje4Smx0D2nQBtZZKWOLMRQtwieNIQEK/Er6FcEEZadpJAbClqplFqhJ9
	9y4pLdgjxhk+CqSz3ZWeWhRhttcfjamSOQZ5yeC/5m6BWB4HyfjdnLCLj83azo4s9jonsE0e9eJ
	x363mmAwt0jbsk2tInmvPaxWb1YlI1/gOqUgdVgUi5+SVfKEl4mV4ZoDf26H85W39PNMMzRuo83
	Kn7ETSQ1yusYaBbDJRL5Z7l91SYUiMSAu/CrsNoq0L5tWYI64JQl4JojACmUah+s2stFAEcPEdH
	uA=
X-Received: by 2002:a17:903:18d:b0:2cc:e7f3:d39e with SMTP id d9443c01a7336-2d052298ccemr6519365ad.2.1785512950890;
        Fri, 31 Jul 2026 08:49:10 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm11852510eec.19.2026.07.31.08.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:49:10 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v3 0/8] wifi: brcm80211: performance and stability improvements
Date: Fri, 31 Jul 2026 15:48:32 +0000
Message-ID: <20260731154901.1822-1-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shivesh <chanelshivesh@gmail.com>

This series addresses several performance bottlenecks and correctness
issues in both brcmfmac (PCIe/SDIO) and brcmsmac drivers.

Changes since v2:
- core.c: Add skb_cow_head() check before skb_push() to prevent a
  kernel panic when the skb arrives with zero headroom in monitor mode
  receive path.
- cfg80211.c: Fix a silent PMKID list corruption bug in brcmf_pmksa_v2_op.
  The shadow entry counter (npmk) was stored in list->length, which was
  then overwritten with the wire-format byte-length at the send: label.
  On subsequent calls, le16_to_cpu(list->length) would decode the byte-
  length as an entry count, silently corrupting the PMKID cache.

Changes since v1:
- Sent with correct author/Signed-off-by address (chanelshivesh@gmail.com).

Patch overview:
  1. flowring: Replace O(N) blocked-ring scan with an atomic per-interface
     counter, fixing a teardown counter leak that permanently stopped netif.
  2. sdio: Coalesce N+1 separate sdio_claim_host/release pairs in the
     rxglom path into a single pair covering all hdparse calls.
  3. core: Populate the radiotap header with RSSI from wlc_d11rxhdr in
     monitor mode, fixing missing signal strength in packet captures.
     Add skb_cow_head() to prevent panic on zero-headroom skbs.
  4. cfg80211: Implement the PMKID_V2 set/del/flush paths for FILS
     fast-roaming support on firmware revision 12 devices. Fix the V2
     shadow counter overwrite bug. Replace mdelay() busy-wait in
     brcmf_delay() with usleep_range().
  5. msgbuf: Increase NR_TX_PKTIDS (2048->4096) and TX flush thresholds
     (32/96->64/128). Fix silent TX stall under high load by using
     test_and_set_bit to guarantee worker scheduling.
  6. pcie: Replace fixed msleep(10) mailbox polling with usleep_range
     exponential backoff. Replace msleep(50) IRQ teardown polling with
     usleep_range for faster teardown.
  7. fwsignal: Document that a duplicate MAC handle ADD is a safe no-op.
  8. brcmsmac/ampdu: Clarify IEEE 802.11n TID compliance comment.

Shivesh (8):
  wifi: brcmfmac: flowring: replace O(N) loop with atomic counter
  wifi: brcmfmac: sdio: coalesce host locks in rx path
  wifi: brcmfmac: core: populate radiotap header with RSSI
  wifi: brcmfmac: cfg80211: implement PMKID_V2 and fix delay busy-wait
  wifi: brcmfmac: msgbuf: tune thresholds and optimize sleep latency
  wifi: brcmfmac: pcie: optimize latency and irq teardown
  wifi: brcmfmac: fwsignal: safe no-op on duplicate MAC add
  wifi: brcmsmac: ampdu: clarify standard compliance on QoS change

 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 123 ++++++++++++++++--
 .../broadcom/brcm80211/brcmfmac/cfg80211.h    |   4 +-
 .../broadcom/brcm80211/brcmfmac/core.c        |  44 ++++---
 .../broadcom/brcm80211/brcmfmac/flowring.c    |  65 ++++++---
 .../broadcom/brcm80211/brcmfmac/flowring.h    |  18 +++
 .../broadcom/brcm80211/brcmfmac/fwsignal.c    |   4 +-
 .../broadcom/brcm80211/brcmfmac/msgbuf.c      |  69 ++++++++--
 .../broadcom/brcm80211/brcmfmac/pcie.c        |  66 ++++++++--
 .../broadcom/brcm80211/brcmfmac/sdio.c        |  62 +++++----
 .../broadcom/brcm80211/brcmsmac/ampdu.c       |  11 +-
 10 files changed, 375 insertions(+), 91 deletions(-)


base-commit: 5e0bcb4920bcb9e0ef6c03a91730fe45f643f3a4
-- 
2.53.0

