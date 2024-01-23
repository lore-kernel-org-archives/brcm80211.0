Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF91A2107
	for <brcm80211@lists.linux.dev>; Tue, 23 Jan 2024 04:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705982715; cv=none; b=mjehUfDfQXn8c769TK8ARsLu7GEkeNw2/Zbw2QesZ07GUjS+nosj3wKtGXUQ/4B726ykStp7mbUdXibz5137UPQffcVvekouz6x3En3YVxPoSkq/s0X+8sVzcL3MElTKlJfsqC84zIlYmlc27aYYD+PwNAs96dBc0zNvsezwhFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705982715; c=relaxed/simple;
	bh=QsZFotQgKDOlLBKfwgaGZq0NXWyvU7kZDwZsaqECxxI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ccKn3lX6HxpQCb6Vd/4Ni9dY9LlHRfqYznY5Unimy4zMkc5zvf5Pa3A10nqppHqJ3eWuA69I2YSdIHydolN5hMdMD7b2zUhPzy0CTsnVQbrpPpW+beUxiYTRC+Bq5ayOVZmJG6I9yaCCe0uV3996AX242qfbAiqAxRhzKJOTqkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org; dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b=VNvPGlVc; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b="VNvPGlVc"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51005675963so525729e87.0
        for <brcm80211@lists.linux.dev>; Mon, 22 Jan 2024 20:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google; t=1705982711; x=1706587511; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=VNvPGlVc1y0ojFac8cYtOp3DGtg3kNoim17KhyiFK5L9X6iZwHB6jxqZOjqYe0M34T
         M8ZjbV8FDhkP+INGdryDk3om5PL6AEnQBCyLxeq3qyVEBhAz103rQqb9M+bT0VNT9E4J
         ISRylx13C6O1UdlzKKK02FvE5X38ekSIuTN73T1TVwTuiJLXAdK7fhNw/R6ZqCM+AnFn
         2zRNmA3ZVWBAQsO+fNo6EScDJ6C3vD58/Kgs3Zrvy9eKIZ/h37TBCzHt3T8s6MRY4fZ9
         BtQBGuQISUe0yxs6nf+zz5XxGnotCEB3BSftIRRCQA/uHTPOWmTgW/fetPGF4M2W2sN3
         6Tiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705982711; x=1706587511;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=JIeJdfsljY+oaOfENYvd9XS+cB240OYNofantc6XvBCSifv6xtWCRpbi7JkLVF2UPf
         B/pvZ60du2E7l9i83z1MZeDz78/3khsuS2+pztIrukwQvOrlY8gPk0Fh4J+k5tMhHMo9
         Lvu3jr56BICc7hXW3MYsJW2Uyh+TuCBRy9kEHNteoM+Ne/Ixe0WAT343KMJRkiODC5lN
         a/rWlXjM6rJrQVs4uctW4J6KzSa+NWumMnvNoJfnI277Jqywzr7KywEN5PXmXaSI8/Nq
         y0miVCFyht2kHfgCgbYmyD5tR/xIVz+PgFj3T76K/SjVxxxqaZ+s5aiQJdbgA7gZX2S+
         gN0A==
X-Gm-Message-State: AOJu0YxM6aAEVYRN4TfmZJ2GvGw/GWNlFbHnb15KZh0emmFl18WjJHos
	sjOgQr0G+k7Es3XfLITgnSEDeoZd2sJj7pjzaF/x7olGSd52b8/X/65Xp+Yyj2l15oi2iC9/pDe
	F02jrq8vO8GPGv6rkpQmft2qd3DfLm1Vtgcm8O7/UlexJRU+l7F4=
X-Google-Smtp-Source: AGHT+IHMO66MJ402PCFiFcuvqUQOykFBBS28SDPrmGdjjUYtXyr7WE+q6iSews84m+Mn10vxoxstlLMYO2XT0V/UvJI=
X-Received: by 2002:a05:6512:b20:b0:50e:7e55:1b0c with SMTP id
 w32-20020a0565120b2000b0050e7e551b0cmr1739148lfu.27.1705982711444; Mon, 22
 Jan 2024 20:05:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Tue, 23 Jan 2024 09:35:00 +0530
Message-ID: <CAH=dH98A-Q2ovCcb51ar5K2D-xt6DpEuXEY+Da=LLQfRTTsg=w@mail.gmail.com>
Subject: Test Mail
To: brcm80211@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello:

 This is a test message to test successful delivery and start the
 archive for the list. Please ignore.

-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
