Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557044;
	b=ZqxN5ngborijY+qyb70zBrwpQXeUoZTVPKzrA7/72hGQ0nQn+h0FiVepZanUlTbfFETY
	 a4nhtLs3X9Pv0kjRKSI9Jf0PJmMOsAbZqLPy8ikkh54CBILAEeV0Rhvy3tj2bp1/yoe40
	 ovWnM2Hvo+TZ2Bw5AljPqGwEMyf1Grt89cwWgtrBGE6wjSPxRlf/OPCDThMC4+UDV2bt7
	 IfDss/hetfqxYvjSYrdlijuW/P6CAliYp9EmU7pkk7JCQ1a0P/WVQ+jW+Z3FSWQR6UUQV
	 e6WJsC1FmAdBbCu2GcFyCLcy7r4s1kkj8PISjo4/TSg6aL3O6sskBPX0mbJAMw4/+2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s70JE8KJI38v26U5JxLEQIN5jyIKDs/r/Z45UhNDVmE=;
	b=1pA8ejbGwTT6OdnL1NQxYBE7LECAJ0zpOiU+vpXW7MXLrmHdqMtiAPg6dVs4wza/URQ6
	 PLvfmh4xkH0BZhpWSJqajnEL463Lwo2d8zimhJHq5B/+ijtr4BVEZ9+9GYEqBllO4caep
	 qVX7ABmFdwvkBIxfuzuJvOlDPc0C0dEdzBWqrlbRDDMn5adRmHitRegpOIOaCY+ICe9JZ
	 TghhQPA2CCVTeCm2FT1nUDyrrWl37upkNhI+Y1zCaHPYLSDhOTwHP6rhyFaihQE0sFAVt
	 AL+yKXZ8I6KAaCK26AfzUhn5eNYmb3Xz8RZ+2Rqtr5QkRcbuVUUfB3RBLS3+UV110Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=StUpVOkN;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF904606A31E
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 21:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF904606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=StUpVOkN
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f04ad2c46dso30002835ad.2
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 13:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557043; x=1796161843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s70JE8KJI38v26U5JxLEQIN5jyIKDs/r/Z45UhNDVmE=;
        b=StUpVOkNxDHKJAwuzaSdLx2TZcHDw2AWxJncXu9+l/EFnvU2VacLwBkisJBTOP9lAr
         Hk2UGzryvCK24OtsTLJ6BpAXIomqkwI1C1e2m/5AEuoZUgsCabfPjVrN3HyudEQBxzGQ
         Hv8hIdrHC8/NeZs4ymVFeBekj8Wki2ocFGT9Zbq68iwGkNxu/pH75h6UPgaCeyN3DOsx
         n9JSQbg0sL429yZaVZONJMylxTfLxhnZrr7LSsI970rIHpVbr9HUKw/yp36bx9upbKWt
         ZmWJMU1s++nFI2qtrMjcaPskF3OrLYJyza38mlgqRKvUqzMjhs2pLPz5TS/N4XE6ZzwI
         m8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557043; x=1796161843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s70JE8KJI38v26U5JxLEQIN5jyIKDs/r/Z45UhNDVmE=;
        b=vcbJFzzs74wLfJZBaulHJr03H3wKxGlaOoxfo9i+pIJ6xAnfQHreFz7QFg539BE5qx
         hYaXCnR1hwnqs+NkX3jFYCFEYvaIhPdlARecPbHXXG5Q6SMvevAsYiP1NWWOIbg7rX1W
         oC19ahq7cLpNsvQh3S4sygtBJOsuBzH54cx8kb4mC7snv7K2xCLWb7Pg6uvMABPj6ldr
         K+aOqmglaq2E/pzzYhiToc0HNmv2mVCCBb+79XKdb80LHuQb94XdgGD2lEebB1meYG+6
         Bc8p3xqzRg8VyhEs9L58DXEifDD3bnfY+xe9UqLTaZBsSFSXdBuP+bq/cAwvm4fnWSyo
         VhYg==
X-Forwarded-Encrypted: i=1; AL+hErGkOsQeZ3EVHwwhrAu/8XrX4VlFboFRdwtiaz3yCi8p/Eq8p2p7JoGd2A9HGnHVIIc1jpor7tD5UDs=@lists.linux.dev
X-Gm-Message-State: APuU4Z8N83DYJEIBVivhYL2Ss0pjt7v11GPiIQ8mAQEC4zu4V8gbjcxA
	bGNIgPVjWtz4QwOWjg4WhRyWx4xGi7YO+MsZTeTWKwEaPIp7NtE/TQVP
X-Gm-Gg: AZFdTZdaaAieuGcL8/1DQAqkhVwg3XzXxFcvB7SrpmP5ZbvdDxRT5AuUHBtXA1Ke6OA
	/dLy272LlQ14abJB2gYxliSw5R5E0LZ8PmjwaQeVDtbXBxmT7Au0QhUGfrnSVpA0c0oM6Axk1CX
	QWww0EqRQeNnGpX4n6ln2EbpUd1rCFB/zHtWrocHPFS50UusVfJ0mwAiqnnwETX0XEOa+tl031L
	iPP9XyqPX4zwou9fGQpbO/yan/hMb+HPCM16ccslrL3MITcs8MJaUDvbrNANMZdGo/sL4S0VI6d
	J2LM9tHPn9y+eBdJVFqpzm7pg5UY67r88aB/xIwY7qhi4anjTcrvBq09CiYhkGfG/HFUTZc+RAj
	pTD7LRtteSLoIHcvFaoaHtJGCy826MLWUHZZUG9AQXgaSpfNdvbjG9ocx57hWNv7CLCMUfNqhJc
	VSSv887f6NjB+y43n00KwxjUQ6K9fktTQRWpUPtNu20J1+eUkVxWYb+bWjw54wjShWfEYFPLteD
	f60VkUGWacDAeBi2ft4AP9uKZ650PI11E8REneb/SM7ge5y+48QkZmG+Z76yeSagVxYa/6mAeBq
	XRSECFJRKYtYYEXQEpyZTffJZ2otQXL4c3HwD/txdhrm8nUMNaUr16zbhdxlRtktMH1xR/ByYDa
	IJkLtftlTe5usTlidVHo6sarjLDpR4SDKKlOjN+75ytQUK5scjiJ7NkQh6BOsbMR5NbtoK3dVpT
	o0zg==
X-Received: by 2002:a17:902:c942:b0:2ed:4456:fb2a with SMTP id d9443c01a7336-2f03f1bfa64mr148507965ad.36.1795557043298;
        Tue, 24 Nov 2026 13:50:43 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm47764545ad.11.2026.11.24.13.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:41 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	brcm80211@lists.linux.dev (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	brcm80211-dev-list.pdl@broadcom.com (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH wireless-next v2 0/7] wifi: brcmsmac: embed fixed-size allocations in brcms_c_info
Date: Tue, 24 Nov 2026 13:50:33 -0800
Message-ID: <20261124215040.1261999-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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
core state and the BSS configuration. Patch 6 also drops the
brcms_c_info::core pointer, which always pointed at the embedded core
state. Patch 7 moves the definition of struct brcms_bss_cfg, unchanged,
above struct brcms_c_info.

There is no functional change. The pub, hw and stf allocations are left
alone: embedding them would touch most of the driver for little gain.

Changes in v2:
- Patch 6: remove the redundant core pointer and use corestate
  directly (Arend).
- Collect Arend's Acked-by on patches 1-7.
- Link to v1: https://lore.kernel.org/linux-wireless/20261111042554.232998-1-rosenp@gmail.com/

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
 .../broadcom/brcm80211/brcmsmac/main.c        | 229 ++++++------------
 .../broadcom/brcm80211/brcmsmac/main.h        |  83 ++++---
 .../broadcom/brcm80211/brcmsmac/stf.c         |  22 +-
 7 files changed, 139 insertions(+), 217 deletions(-)


base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
--
2.56.1

