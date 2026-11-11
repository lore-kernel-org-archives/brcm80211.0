Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371172;
	b=HJ4SuUsSNCwQ2tH27OAsWcw62n6i9uAygZ38gbH+dxxaIjI5bsNd1GFHwH1q7CH0sjQ0
	 D2LAthGec2ROBR+liS7ZcCMugK23gMBNxRJYKtUbaMRz5WH3HxQoi3w8qxSNhd2gOvM7g
	 n+6jiPB4zp8tWcixa7Z3BU7ueFLbPCUNCHLfnSJ7TIZh/dZMGKn1wOLu+eAXG28ZtSX8K
	 TtUtChz5QY9gkuZpOJGdyaeBSVClSQyzs1JL7HyIdMBOgqfp/NA+5qSdCBtxLmXR7nWnO
	 4izylRFoh8DNQe4fxNBPRUyPk83aq70H+YCTM5zAwHfOkifZLuzYqp6HXNHDRFHaxpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FFlOFP5DVT2Rk2YGKhSaGCUCFiztJA5CULaLG82EQoY=;
	b=PwPbXjfOzvR5thtnC2NvxuU6v72hcUKXBvdU7375/51wj5V2myECPu/ilAQifREqBpqC
	 JTotS56Wh8G147ggrubo7MSRrd13hkggrM7x5C40U7rZZ7fwwIKi8uA5tT7gmXQ4QLAop
	 ob+BlhrNKhblMrNSDP4YUSWCdPRmKxcf4BLaHlh6EYSzICfFyXoVWdgrI+LGRwxjSC/e1
	 OY5pxKUM92lQnKsDfHxRBhQJ0zkwmm5z/UV6pCyaDOLGncnN+qGChvXiVlsCCAxrH64xP
	 t5HvBDVOYE4ir6x+yH7CM51DmuZQxmY5/CcGqd3qqTp/Pboi5Jj1bPyY/+Q/0jmEhNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eo9nFBbe;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69174606A332
	for <brcm80211@lists.linux.dev>; Wed, 11 Nov 2026 04:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69174606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eo9nFBbe
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so1165925a12.1
        for <brcm80211@lists.linux.dev>; Tue, 10 Nov 2026 20:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371172; x=1794975972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FFlOFP5DVT2Rk2YGKhSaGCUCFiztJA5CULaLG82EQoY=;
        b=eo9nFBberAfsx3RhwUVkPW/GTmyoX6QMRBGON26GrK0hw63HnSP/uP3mhVKCYIIAdB
         X7yLbA1l4FVXZdC76JfneDQxDm2v0EHROGsn0+2qfazvEK30xfiSwW7xOPyubqqHkk89
         WyggGt8AViYJgNJ5KdJ2CvRrVlncQ4tZWnLB3Pnli3M2HB2oCzlMg+BUgE1ruaS0uknN
         0B5XJ4CwuvNb/XdnnEo3wi4j8xR1k4mW06F1xa0or4f+NcoY5O/KpT4yDn6IPSiZ0AtU
         IXCt73GrcXWElqfWAkLRtB6t5pB9gBR7qtio13d6RtpJaCSfhsQ4bbIbhre1vyR57Xup
         pBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371172; x=1794975972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFlOFP5DVT2Rk2YGKhSaGCUCFiztJA5CULaLG82EQoY=;
        b=s5orD3SPzavscDqLq67EkJTEpi6GzSca99EijqHJLTM2KxFeqExquxaJ+iMm5xtzUc
         YKgA79ftbrOeust3FbtpsQNvadYqkGiEo0p4WdbU0k23IvIGoqUQl27IHgH2AC0TfO6I
         OcajsIuw+BKGrUn6Vhv5K3Ryf/C1tAqClj2jpVwfsPnhzemBdxvhbS1wH6WKQ3nzHQXa
         1uZlZop1l6rOEZl8EkGFN3LOeeD5EWDUSmMZeQYe8liG/CWIJ7Po7LgEWCcxB19bx5C5
         +B++eYObUzhpO4T8NTI1QndIoKikRBZUdkizeHg0ENXriz8vcLKbGa4SlaLXyJKDjZBX
         QLsQ==
X-Forwarded-Encrypted: i=1; AL+hErHRwTtjmh+hmS54mNP2yj8DBXU8Ic8C1cla+g9sI6+m5jAANqemlrOmD27yr/aEkrUrJKuYYuRf2ms=@lists.linux.dev
X-Gm-Message-State: APuU4Z8BL39J9DcCQJ+6PMAwLovukuSI8mR4QXSIp6Ult9mNA36XzU0q
	uf5QtSEIQwcP7oI//enB/rmpysqeM3XnJyKDkPYyU+sfuDHfwVYvcZ+M
X-Gm-Gg: AYBFou3ybgzJvalIC1c6c1EJFOwg3F6bFMSiwjgj+Pz4+tSLy+zQwcQGl6HZ3qHozMp
	W6B5CFwJ/wi1yxjAUNWMWl61Oxa4cpB+zBLSknT7ocEXtBJQAtz7j30f8LQx5eb851aO3ZcSLeh
	4kXBR80XZSXKXPL2m0LJEfwbYO4bJGRncylzuxglG6ycyb2unhoiKEwacsB5xWXcc/jlvkvL5Uv
	xhisYlK3/A7HS7F/V3419EX5AsQ2AI8wdVX75+xkYDfYXoqyuVMsy4kJdHEvSeExA2la0Hw7/LO
	x0gdFV2AgVnKk2l71dgLOebCKkrz2OAg7ajx3aS+5iHYX5Jqm2SwO/ER2pp02wRmz45DnInyEZ4
	X+5mx6eZMca8tSd3O2omB6b1n6Xha/pDrK6OMgsg/CwFMN1cja9ljSU7cVHwzeX4+dljJf0MNdf
	yCKYXt7V2FSL4At3TXCI93mVs2ayBD9YkFKrejZ53DXDiSruunuArF9ZDxt3rL9LjLvlYahaqlM
	WojVQbCqM5UVs7RIFlKxWBrdE83lo1YkTF4YBvVX8M15ivybfmCh9kDi3Jtp/Bv4WJhmXzdl9VJ
	v4F7dHbAQQ2rssXLYAM0WaW9Isq43b9yZrjS4QzX8YTlEfmzL4ZttD1aWmPDDCY+akfygd3p4kt
	53og3kGbu8acNrzRjTXQ6DaJgqVv6SCZg9HvoAjseB2MTiZMrxZ+BjewgAMzuKwHr+4VM92RaOd
	rZm78=
X-Received: by 2002:a17:90b:4b84:b0:3a7:db88:3491 with SMTP id 98e67ed59e1d1-3b182f2862cmr1142659a91.33.1794371171647;
        Tue, 10 Nov 2026 20:26:11 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2473927a91.11.2026.11.10.20.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:09 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 0/7] wifi: brcmsmac: embed fixed-size allocations in brcms_c_info
Date: Tue, 10 Nov 2026 20:25:47 -0800
Message-ID: <20261111042554.232998-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

brcms_c_attach_malloc() allocates struct brcms_c_info and then a number
of fixed-size structures that live exactly as long as it does, each with
its own kzalloc(GFP_ATOMIC), error code and kfree(). This series embeds
seven of them in their parent structures. That removes the allocations
and their OOM error paths and, for the per-band state, the open-coded
pointer arithmetic that carved two arrays out of one allocation.

Patch 1 embeds the per-band state arrays of brcms_c_info and
brcms_hardware. Patches 2-7 embed the module callback array, the MAC
statistics snapshot, the default BSS info, the protection settings, the
core state and the BSS configuration. Patch 7 moves the definition of
struct brcms_bss_cfg, unchanged, above struct brcms_c_info.

There is no functional change. The pub, hw and stf allocations are left
alone: embedding them would touch most of the driver for little gain.

Each patch builds with W=1 (arm64, clang) and passes checkpatch.
Compile-tested only.

An AI coding assistant (Claude Code, Claude Opus 5.5) was used to review
the series, resolve rebase conflicts, write patches 5-7, and draft the
commit messages and this cover letter.

Rosen Penev (7):
  wifi: brcmsmac: embed bandstate arrays instead of separate allocation
  wifi: brcmsmac: embed modulecb array instead of separate allocation
  wifi: brcmsmac: embed macstat_snapshot in brcms_core
  wifi: brcmsmac: embed default_bss in brcms_c_info
  wifi: brcmsmac: embed brcms_protection in brcms_c_info
  wifi: brcmsmac: embed brcms_core in brcms_c_info
  wifi: brcmsmac: embed brcms_bss_cfg in brcms_c_info

 .../broadcom/brcm80211/brcmsmac/ampdu.c       |   2 +-
 .../broadcom/brcm80211/brcmsmac/channel.c     |  14 +-
 .../broadcom/brcm80211/brcmsmac/debug.c       |   2 +-
 .../broadcom/brcm80211/brcmsmac/mac80211_if.c |   4 +-
 .../broadcom/brcm80211/brcmsmac/main.c        | 226 ++++++------------
 .../broadcom/brcm80211/brcmsmac/main.h        |  82 +++----
 .../broadcom/brcm80211/brcmsmac/stf.c         |  22 +-
 7 files changed, 138 insertions(+), 214 deletions(-)


base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
-- 
2.56.0

