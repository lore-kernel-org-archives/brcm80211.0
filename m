Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547D72DC32E
	for <brcm80211@lists.linux.dev>; Wed, 14 Oct 2026 00:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791939362; cv=none; b=tsQEf5LbSez/28Db205Cp8iPgNX1qwlsQQayDn4Ke+6IV8led5g55xUtFJaB7wXvAoI7Hq4hDQdnRn94uSxSEkt/0llMNkOOrJS2z3lC80lkLlEQGILoDnQ5/WSwMaOAjoJorBeeONLiM5c8+izVJfS4lQta3CYzyCYvB3nO+7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791939362; c=relaxed/simple;
	bh=0rogUu4QkF17ZLJAaaspEh/DNCFstmo4ri+cWV90+MM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WxLxlAW2uQAlNvXH7dJNyBiQ+zG1q7oRLpUMxZIUD5EhER036NWgeHsRg7HgiqZgvFSV/b3cHnb/1rd+RvPsGSMce9noRazwYUepbhHv75+pnkArrNBKk6e/+S7kErD2maJO9I9jPk8Mkv6bC+T3mdouyNgAPLxDOQGYOMD29qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiFrxNGh; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiFrxNGh"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1419d3416ceso695178c88.0
        for <brcm80211@lists.linux.dev>; Tue, 13 Oct 2026 17:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791939359; x=1792544159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XxW2/JWpAEpLHapcMk1I83pgwiqBPA5dyGFRHFqowQk=;
        b=DiFrxNGh6k2rElGO4p40+1SI0g8oY5VnvTr2DNKICiSH9DknogH+kJm9W8A8U8csaf
         ZalXbvA9HRhhGjgDKH9EgPRKcZrb+Itf9otVlbdUS5o/g2lKAA7nV6tClEMOAmVFIGqG
         45KhDvJm9DMBy85rZNH4ns3G2T3H65t3VCpLBFMndMfDoVV1YcMdm9YXSso6X1VAwLso
         EQM5MfjSGPpfIGz7G/VRSudfxmjfl3RiTe202TuEDeS+O4ym8DpbYSH2Mo11MFefJrH1
         BplTbjUG/XmgzPoAhI+9RsTdIIGbUkjajRrfL5rfV2W5mqg8bJbJJBKufzrNDpja2x+N
         Qc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791939359; x=1792544159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XxW2/JWpAEpLHapcMk1I83pgwiqBPA5dyGFRHFqowQk=;
        b=mYbnrmMFln+o+3Bd+bTMqyH/7g18vXvHOmpCdstD+qK8vK67fJadG8akel20cMbPFM
         DVvrQtCxUuy4J1ArNSxii6VUODSLSLNuGT7Fk9QNtc4gYy3mWKpBoBTH5MPnn8fdtmf6
         28b7MsZnRR9MDbTQVTT63O9CeXd01bcHEjifS89plh5Q6489QkzXHwTUMYQ/6o7JZTBj
         73weT45nUHpC+UyngYmq5KVtO9de6H0gXKjT52EZAHcrzVAVGj973U61HUbE7fuV79+k
         pEgh16SHtJFjdeb9se84jgPdcd3Tx0v92JmBh2bR+7ObGbLQEVI+OjSbPNgCklQaHmZL
         99zA==
X-Forwarded-Encrypted: i=1; AKwUvBwDBc3THTPDRiUykfJ8tzlKch1R6pZlNKtF8tKwncdJ3vYa3x5T4usO5tyKl9AT686BjNMqWZuEk2c=@lists.linux.dev
X-Gm-Message-State: AFq9FYKuDhrxOeC+jEoRGJE3419WbJeChCZ4VpC06ZDs/zzxhQDxWIdJ
	u97Xjpxj3RM09mP/OeCTPRUbAcxC6J2TWfuOP13axYGtUOcBZDBLwM+T
X-Gm-Gg: AYBFou1rZG1ymPHFyvWdZAdjUWkbSyCF/5jtpQNpwCqdfgVxQBIJkaovBSWNzRIkmNF
	S6CicQlLGfjruO9oWKVyI+3cRbxRzV07DK6IQj3AT6Ae1F8QqC6enFjjEp9Yk5K/rL43Q3Lcipo
	8dDSjakbzSEoKxardYIJnZjciglUMUlGD+jXvQWeSTJ0o1H4FuJqB/D4EIcTywjkBYwXI9Uq/7b
	6CFbQJEm/bEIYFtsBvYHYdAoqWoL+9KlAUMKD0GTkSewqpmYfjhBcQwSDFTxjSgEqboV2PkkJvl
	i++T162mgdWsPxgyVO1gPxUGVwEN5eefA46vtTXES1hpdxF5aNdOAFlJ7p0+vhq15CQNBOPkJ8/
	EqyOSmm79LixgwikRbdvJx+1Vro5uIk8eHoj3fIvapI9hUhduVGkhpDZJ5eSzsSEqlMTm/aQCzn
	Srmlysbsy0xpjsms2Z6M2R85w+w96iUmE5RL9Zd2I801V8Alu45YMU3aLSctJ9Xxc6MD3ycav27
	4ymL3CAEGjs6eutluBa7vkJ0z2aqMsO0CAo+atoNrw=
X-Received: by 2002:a05:7022:1608:b0:150:1cea:31a8 with SMTP id a92af1059eb24-16a60bf2778mr16551597c88.19.1791939359163;
        Tue, 13 Oct 2026 17:55:59 -0700 (PDT)
Received: from homik.fullerton.edu ([137.151.175.208])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a4429603sm39561692c88.17.2026.10.13.17.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 17:55:58 -0700 (PDT)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	morbo@google.com,
	kees@kernel.org,
	justinstitt@google.com,
	codemender-patching+linux@google.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH] wifi: brcmfmac: Replace strlcat() with snprintf() in brcmf_fw_alloc_request()
Date: Tue, 13 Oct 2026 17:55:52 -0700
Message-ID: <20261014005553.71803-1-nikitash.mariiaw@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bill Wendling <morbo@google.com>

brcmf_fw_alloc_request() constructs firmware file paths by chaining
strscpy() and multiple strlcat() calls for the module parameter path,
separator, base name, and extension.

In preparation for removing the deprecated strlcat() API[1], format the
complete firmware path in a single snprintf() call.

Link: https://github.com/KSPP/linux/issues/370 [1]
Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---

This patch was originally part of Bill Wendling's strlcat() removal
series [2], and I am shepherding it individually to the subsystem
maintainers.

No code changes from the original posting [3].

[2] https://lore.kernel.org/all/20260915081910.4142719-1-morbo@google.com/
[3] https://lore.kernel.org/all/20260915081910.4142719-12-morbo@google.com/

 .../broadcom/brcm80211/brcmfmac/firmware.c    | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
index 22ff326f1924..2f74a952599e 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
@@ -845,22 +845,17 @@ brcmf_fw_alloc_request(u32 chip, u32 chiprev,
 	fwreq->n_items = n_fwnames;
 
 	for (j = 0; j < n_fwnames; j++) {
-		fwreq->items[j].path = fwnames[j].path;
-		fwnames[j].path[0] = '\0';
 		/* check if firmware path is provided by module parameter */
 		if (brcmf_mp_global.firmware_path[0] != '\0') {
-			strscpy(fwnames[j].path, mp_path,
-				BRCMF_FW_NAME_LEN);
-
-			if (end != '/') {
-				strlcat(fwnames[j].path, "/",
-					BRCMF_FW_NAME_LEN);
-			}
+			snprintf(fwnames[j].path, BRCMF_FW_NAME_LEN, "%s%s%s%s",
+				 mp_path, (end == '/') ? "" : "/",
+				 mapping_table[i].fw_base,
+				 fwnames[j].extension);
+		} else {
+			snprintf(fwnames[j].path, BRCMF_FW_NAME_LEN, "%s%s",
+				 mapping_table[i].fw_base,
+				 fwnames[j].extension);
 		}
-		strlcat(fwnames[j].path, mapping_table[i].fw_base,
-			BRCMF_FW_NAME_LEN);
-		strlcat(fwnames[j].path, fwnames[j].extension,
-			BRCMF_FW_NAME_LEN);
 		fwreq->items[j].path = fwnames[j].path;
 	}
 
-- 
2.43.0

