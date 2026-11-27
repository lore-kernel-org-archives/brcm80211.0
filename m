Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759976;
	b=oSxufz4J8xlGs8HDrDwbaimpZni8MMUa2TeOx8RcRxDjxpzkgVv2A3CFWhFZlSP7jKI7
	 GzGNKLLynK/1X0ZZA55PWLjg7mDsXAdPIU+n6xsXipiF+aPjzlNqm6zqVH6s+aegqYrzF
	 RadDCtIu+ikLKQ1zOdOsqCyit2LHogHtZiJcjf/0Dm2wWh4Y0N9CMNU+oXiL9tHg/wptn
	 USfUbFDZ6FT/0DNCVQUrZL9obCYwUBnsJXih390mFa83X19Zo+hGDg/+tIDYw43vmNOHr
	 o4KWCa7u+0qfgr7O5KtRsYcg771RJDmgq25S1Jf7RWmRW3lr8Fjh+XP9dEEungztkDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jKbMVWTEY/YfvqqDd7MNrskixYQs06C/5wtffZ5UBTM=;
	b=q9Uzs3C2J465CPpi9Zw2PsP9k1OSljthXs6mCkxueV5Oli+qZVke9P9bRG6FDEOmsmdh
	 zvz2ZZCLQ+yIo+mr9MDh2igOCuhDu+BtxYsRE8Qy6XbFwwSNS74n2uSP5dGNqvl411TqS
	 x0c3gr2SN2zSI74bujvzO0AY4KQf2PjktZmMBvvG5kTPPTNWKTaNJ9734Btu6jGmhLPmk
	 Ws61RFfbbhYhUUCrp5fB5Jsth0ycEQGAab7IhsZXLwiKXb96teV509VPe0KXOBp9M4IK4
	 C1GANwPeLwHiMJIQCpfsg1XjRkunoAvrnsWjzOqGMeHw5IIFvUGHZ2FXia8muDaovYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nfzeitIF;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0A8606A321
	for <brcm80211@lists.linux.dev>; Fri, 27 Nov 2026 06:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED0A8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nfzeitIF
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3863db981d4so10847392eec.0
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 22:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795759975; x=1796364775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jKbMVWTEY/YfvqqDd7MNrskixYQs06C/5wtffZ5UBTM=;
        b=nfzeitIFKMcxupUycml2cLvrocf8YlRyue7zT0WpBzOGNdvp36czSCd1x7d5eiVKad
         1Ym0ecmldziHzKfa7+MqBwnw5rEHgbSKTseLOAAmVa0F3jONtTsyHZWUBgyOSOiIdqxX
         /fJD88sS0feE/8732BrAorcb6ocMSt8GG+gQUpm5y+VYcYEcX9qgkiG6Lh/iq6VlD2c6
         Lea0MeRQ0mztkylexG5zqOXh4piFlIxuFhqsAQMbpXk+Uwf/aIRANjlFubYRbE/PQg8L
         G8apKryzWFxo3Zpz0WHfTFO1hEF2K+o5HYOsU8W65jt4UwecVfaQc/IjNr7QpalXSjn7
         GfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795759975; x=1796364775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jKbMVWTEY/YfvqqDd7MNrskixYQs06C/5wtffZ5UBTM=;
        b=goESPTlXZN65xkR7rvRWXgfBaQqt73eVQndK1SxfriQAZEkzIKbVicu7r6WQX1fIGL
         Ewn+h6mJlu02j0I/1CJlMa8TZpeJIDcfRbAZQw3Lou8nnCQFaZr7KasQve49+cMMpLeT
         tIiUT4q+nid3BkM/BV3SVwkv6UjUz5r3GFNmonDnYNzxu4Dk2eX8c+NrRA6d4YRr/D8L
         dkq362OYZQ/Ay8fK22ixNdwCrkBl3xPRRyF+rjeSGyDYnVhhas4vgSPwkYeh2pY4UdpZ
         skQxqTAMGneGBEMjw7q/BpyNmVWzvePYMtB1lPWLdj+wAbtnHFUnuI3uqgB6ZK4dz5Z+
         6x4g==
X-Forwarded-Encrypted: i=1; AL+hErEXtulIGEWX2sVt9uyZ5XuRuZGP80N7gmi64WFfPUZN7x8gstMlUHRgl0v93GcNKWOQpJ8FgBXBdlM=@lists.linux.dev
X-Gm-Message-State: APuU4Z984xscRsyvVT3z1YGpM73M2iHF4gcZgHaoSVA8qQ0b2mzOR6lR
	KWdaDOH3J3ripVmvz1pI0p/31ToJmTi6NoZhllSiAWvecV4MKbIOBJpc
X-Gm-Gg: AZFdTZdV/egBNPreVyq7XeCJufTUK5jkVOL6/lqY1fULM6vbL1zmDjMzpLMyUO79Lju
	pEnlBt70bH1/C9tM4ZCoZfXUsYUdZ7nDxQ4UIDYSExWzJAEE1tBAF6OBSM30d1ZctcfRS7+AmQu
	6Fx1dUDCr4lwv6kNmuq+gLUK9leJnC+vomXaGOjv8QFh/jNk7valxRt/XV/BYkMqARphIzYAxhn
	qUG9dfDO4qJuyyEs/xwIsDRVUl67UySlJEYMsA0Dfe7opsbqZJq/lJ18rbFuetNHqhmV68Zajc3
	CXXQTidQMbcn5M/2JYbSlocZbnojDSb/n/EiQSRfTZyVLuLxr51ndqTOOSRwObDME/+gFWaKqYc
	YW8f5exqZ9vaKYA/AVDrgan2ZHWqf/P1SvhDT804NZt750dKyZwMyGfYeBxxx98KRmwzPpvqI29
	s9Knjvk+LLxQyJJo6TGfg5AuM2VxrrNQZMj5rvq57OdXDZOJ1r9RvRlkxyKanzI5Gru7MPqXgfF
	8tZSFE8JdZvpBss+XNQNLW/CRxlQEWOTIzOQslJXtlKFLFYcTxtT3kKQAUVksTHAfqDhmul0hLH
	tKVFV4VsLBiAEEr5dAHM1EAAHjmwBzVcID42WPrTf1Flh2Z7rKJxIu6qKBZcjsKHSmswIg==
X-Received: by 2002:a05:7301:6408:b0:36a:270:ce76 with SMTP id 5a478bee46e88-38570f2b27dmr23879947eec.33.1795759975049;
        Thu, 26 Nov 2026 22:12:55 -0800 (PST)
Received: from acemagic-m1.lan ([2401:7400:c804:b668:d6a6:bf90:ed18:c855])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm40300425eec.18.2026.11.26.22.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:12:54 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>
Subject: [PATCH wireless-next v2 00/11] wifi: prepare shared code for brcmbmac
Date: Fri, 27 Nov 2026 14:11:30 +0800
Message-ID: <20261127061147.506129-1-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches move brcmsmac's d11 core definitions, its rate, PLCP,
frame timing and RTS rate helpers, and its channel and rate tables to
the shared brcm80211 directories, so that the brcmbmac driver for the
BCM4323x USB adapters, sent separately, can share them instead of
copying them:

The last patch moves brcmfmac's USB bootloader definitions to a shared
header.

Apart from patch 5, these patches change no behaviour.
Compile-tested only for brcmsmac and brcmfmac.

Changelog v2:
- Move brcmfmac changes here too.

Ragul Balaji (11):
  wifi: brcmsmac: make d11.h self-contained
  wifi: brcm80211: move d11.h to the shared include directory
  wifi: brcmsmac: look up OFDM rates in rate.c
  wifi: brcmsmac: give the rate tables and helpers a brcmu_ prefix
  wifi: brcmsmac: round short-GI L-SIG lengths up to whole symbols
  wifi: brcmsmac: pass the band to the PLCP and frame timing helpers
  wifi: brcmsmac: move the PLCP and frame timing helpers to rate.c
  wifi: brcmsmac: move the RTS rate selection to rate.c
  wifi: brcm80211: move the rate helpers of brcmsmac to brcmutil
  wifi: brcm80211: move the channel and rate tables of brcmsmac to
    brcmutil
  wifi: brcm80211: move the USB bootloader definitions to a shared
    header

 .../broadcom/brcm80211/brcmfmac/usb.c         |   68 +-
 .../broadcom/brcm80211/brcmsmac/Makefile      |    1 -
 .../broadcom/brcm80211/brcmsmac/ampdu.c       |   34 +-
 .../broadcom/brcm80211/brcmsmac/dma.h         |   27 -
 .../broadcom/brcm80211/brcmsmac/mac80211_if.c |  153 +--
 .../broadcom/brcm80211/brcmsmac/mac80211_if.h |    9 +-
 .../broadcom/brcm80211/brcmsmac/main.c        |  741 ++----------
 .../broadcom/brcm80211/brcmsmac/main.h        |   26 +-
 .../broadcom/brcm80211/brcmsmac/phy/phy_cmn.c |   17 -
 .../broadcom/brcm80211/brcmsmac/phy/phy_hal.h |    3 +-
 .../broadcom/brcm80211/brcmsmac/pub.h         |   35 +-
 .../broadcom/brcm80211/brcmsmac/rate.c        |  514 --------
 .../broadcom/brcm80211/brcmsmac/stf.c         |    4 +-
 .../broadcom/brcm80211/brcmutil/Makefile      |    2 +-
 .../broadcom/brcm80211/brcmutil/band.c        |  140 +++
 .../broadcom/brcm80211/brcmutil/rate.c        | 1077 +++++++++++++++++
 .../broadcom/brcm80211/include/brcm_usb_rdl.h |   78 ++
 .../broadcom/brcm80211/include/brcmu_band.h   |   26 +
 .../{brcmsmac/rate.h => include/brcmu_rate.h} |  170 ++-
 .../brcm80211/{brcmsmac => include}/d11.h     |   43 +-
 20 files changed, 1637 insertions(+), 1531 deletions(-)
 delete mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmutil/band.c
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmutil/rate.c
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/include/brcmu_band.h
 rename drivers/net/wireless/broadcom/brcm80211/{brcmsmac/rate.h => include/brcmu_rate.h} (51%)
 rename drivers/net/wireless/broadcom/brcm80211/{brcmsmac => include}/d11.h (97%)


base-commit: 3c311bf321442d4c4f452a1a08bc9efce242a1f9
-- 
2.53.0

